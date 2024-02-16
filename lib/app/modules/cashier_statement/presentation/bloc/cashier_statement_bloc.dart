import 'package:appweb/app/core/shared/helpers/local_storage.dart';
import 'package:appweb/app/core/shared/local_storage_key.dart';
import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/cashier_statement_customer_model.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/cashier_statement_model.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/cashier_statement_salesman_model.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/customers_old_debit_model.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/salesman_model.dart';
import 'package:appweb/app/modules/cashier_statement/domain/usecase/cashier_statement_get_by_customer.dart';
import 'package:appweb/app/modules/cashier_statement/domain/usecase/cashier_statement_get_by_day.dart';
import 'package:appweb/app/modules/cashier_statement/domain/usecase/cashier_statement_get_by_month.dart';
import 'package:appweb/app/modules/cashier_statement/domain/usecase/cashier_statement_get_by_order.dart';
import 'package:appweb/app/modules/cashier_statement/domain/usecase/cashier_statement_get_current_date.dart';
import 'package:appweb/app/modules/cashier_statement/domain/usecase/cashier_statement_get_customers.dart';
import 'package:appweb/app/modules/cashier_statement/domain/usecase/cashier_statement_get_salesmans.dart';
import 'package:appweb/app/modules/cashier_statement/domain/usecase/get_customer_old_debits_by_salesmans.dart';
import 'package:appweb/app/modules/cashier_statement/domain/usecase/get_salesmans.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_event.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_state.dart';
import 'package:bloc/bloc.dart';

class CashierStatementBloc
    extends Bloc<CashierStatementEvent, CashierStatementState> {
  final CashierStatementGetByDay byDay;
  final CashierStatementGetByMonth byMonth;
  final CashierStatementGetByCustomer byCustomer;
  final CashierStatementGetByOrder byOrder;
  final CashierStatementGetCustomers customersCharged;
  final CashierStatementGetSalesmans salesmanCustomersCharged;
  final CashierStatementGetCurrentDate getCurrentDate;
  final GetCustomerOldDebitsBySalesman getCustomerOldDebitsBySalesman;
  final GetSalesmans getSalesmans;

  List<CashierStatementModel> cashierStatement = List.empty();
  List<CashierStatementCustomerModel> customers = List.empty();
  List<CashierStatementSalesmanModel> salesmans = List.empty();
  List<CustomersOldDebitModel> customerDebits = List.empty();
  List<SalesmanModel> salesmanList = List.empty();

  int customerIndex = 0;
  String dtCashierToday = "";
  String dtCashierMonth = "";
  String nameSalesman = "";
  String dateSelected = CustomDate.newDate();
  String nameCustomer = "";
  int tbSalesmanId = 0;
  int page = 0;

  CashierStatementBloc({
    required this.byDay,
    required this.byMonth,
    required this.byCustomer,
    required this.byOrder,
    required this.customersCharged,
    required this.salesmanCustomersCharged,
    required this.getCurrentDate,
    required this.getCustomerOldDebitsBySalesman,
    required this.getSalesmans,
  }) : super(LoadedState()) {
    cashierStatementGetByDay();
    cashierStatementGetByMonth();
    cashierStatementGetByCustomer();
    cashierStatementGetByCustomerBySalesman();
    cashierStatementGetCurrentDate();
    cashierStatementGetByOrder();
    cashierStatementGetCustomers();
    cashierStatementGetSalesmans();
    returnListSalesmanEvent();
    returnToCustomerDesktopEvent();
    goToOrderDetailPageDesktop();
    _getCustomerOldDebitsBySalesman();
    _getSalesmanList();
    _goBackToMainForm();
  }

  cashierStatementGetCurrentDate() {
    on<GetCurrentDateEvent>((event, emit) async {
      emit(LoadingState());
      var response =
          await getCurrentDate.call(ParamsCashierStatementGetCurrentDate());

      var result = response.fold((l) {
        return ErrorState(msg: l.toString());
      }, (r) {
        dtCashierToday = r.dtRecord;
        dateSelected = r.dtRecord;
        dtCashierMonth = CustomDate().getMonth(dtCashierToday);
        LocalStorageService.instance
            .saveItem(key: LocalStorageKey.dtCashier, value: dtCashierToday);
        return GetCurrentDateSucessState();
      });

      emit(result);
    });
  }

  cashierStatementGetByDay() {
    on<CashierStatementGetByDayMobileEvent>((event, emit) async {
      emit(LoadingState());

      var response = await byDay.call(event.params);

      var result = response.fold((l) => ErrorState(msg: l.toString()), (r) {
        cashierStatement = r;
        return MobileSuccessState();
      });

      emit(result);
    });
  }

  cashierStatementGetByMonth() {
    on<CashierStatementGetByMonthMobileEvent>((event, emit) async {
      emit(LoadingState());

      var response = await byMonth.call(event.params);

      var result = response.fold((l) => ErrorState(msg: l.toString()), (r) {
        cashierStatement = r;
        return MobileSuccessState();
      });

      emit(result);
    });
  }

  cashierStatementGetByCustomer() {
    on<CashierStatementGetByCustomerMobileEvent>((event, emit) async {
      emit(LoadingState());
      //posicina o cliente na lista para mostrar na proxima tela do detalhamento

      var dtCashier = await LocalStorageService.instance
          .get(key: LocalStorageKey.dtCashier);
      if ((dtCashier == null) || (dtCashier == "")) {
        dtCashier = CustomDate.newDate();
      }
      event.params.date = CustomDate.formatDateOut(dtCashier);
      var response = await byCustomer.call(event.params);

      var result = response.fold((l) => ErrorState(msg: l.toString()), (r) {
        cashierStatement = r;
        return ByCustomerState();
      });

      emit(result);
    });
  }

  cashierStatementGetByCustomerBySalesman() {
    on<GotoCustomerListDesktopEvent>((event, emit) async {
      emit(LoadingState());

      event.params.date = CustomDate.formatDateOut(event.params.date);
      var response = await customersCharged.call(event.params);

      var result = response.fold((l) {
        return ErrorState(msg: l.toString());
      }, (r) {
        customers = r;
        return GoToCustomerListDesktopSucessState();
      });

      emit(result);
    });
  }

  cashierStatementGetByOrder() {
    on<CashierStatementGetByOrderMobileEvent>((event, emit) async {
      emit(LoadingState());
      //posicina o cliente na lista para mostrar na proxima tela do detalhamento
      if (event.params.date.isEmpty) {
        var dtCashier = await LocalStorageService.instance
            .get(key: LocalStorageKey.dtCashier);
        if ((dtCashier == null) || (dtCashier == "")) {
          dtCashier = CustomDate.newDate();
        }
        event.params.date = CustomDate.formatDateOut(dtCashier);
      }
      var response = await byOrder.call(event.params);

      var result = response.fold((l) => ErrorState(msg: l.toString()), (r) {
        cashierStatement = r;
        return ByCustomerState();
      });

      emit(result);
    });
  }

  cashierStatementGetCustomers() {
    on<CashierStatementGetCustomersMobileEvent>((event, emit) async {
      emit(LoadingState());
      if (event.params.date.isEmpty) {
        var dtCashier = await LocalStorageService.instance
            .get(key: LocalStorageKey.dtCashier);
        if ((dtCashier == null) || (dtCashier == "")) {
          dtCashier = CustomDate.newDate();
        }
        event.params.date = CustomDate.formatDateOut(dtCashier);
      }
      var response = await customersCharged.call(event.params);

      var result = response.fold((l) => ErrorState(msg: l.toString()), (r) {
        customers = r;
        return CustomerMobileSuccessState();
      });

      emit(result);
    });
  }

  cashierStatementGetSalesmans() {
    on<GoToSalesmanListDesktopEvent>((event, emit) async {
      emit(LoadingState());

      var response = await salesmanCustomersCharged.call(event.params);

      var result = response.fold((l) {
        return GoToSalesmanListDesktopSucessState();
      }, (r) {
        salesmans = r;
        return GoToSalesmanListDesktopSucessState();
      });

      emit(result);
    });
  }

  returnListSalesmanEvent() {
    on<ReturnSalesmanListDesktopEvent>((event, emit) async {
      emit(ReturnSalesmanListDesktopSucessState());
    });
  }

  returnToCustomerDesktopEvent() {
    on<ReturnCustomerListDesktopEvent>((event, emit) async {
      emit(ReturnCustomerListDesktopSucessState());
    });
  }

  goToOrderDetailPageDesktop() {
    on<GotoOrderDetailDesktopEvent>((event, emit) async {
      emit(LoadingState());
      //posicina o cliente na lista para mostrar na proxima tela do detalhamento

      var dtCashier = "";
      if (event.params.date == "") {
        event.params.date = CustomDate.formatDateOut(dtCashier);
      }
      var response = await byOrder.call(event.params);

      var result = response.fold((l) {
        return ErrorState(msg: l.toString());
      }, (r) {
        cashierStatement = r;
        return GoToOrderDetailDesktopSucessState();
      });

      emit(result);
    });
  }

  _getCustomerOldDebitsBySalesman() {
    on<GetCustomerOldDebitBySalesmanEvent>((event, emit) async {
      emit(LoadingState());
      if (event.params.page == 0) {
        if (customerDebits.isNotEmpty) {
          customerDebits.clear();
        }
        page = 1;
      } else {
        page += 1;
      }
      event.params.page = page;

      var response = await getCustomerOldDebitsBySalesman.call(event.params);

      var result = response.fold((l) {
        return ErrorState(msg: l.toString());
      }, (r) {
        customerDebits += r;
        return GetCustomerOldDebitSucessState(list: customerDebits);
      });

      emit(result);
    });
  }

  _getSalesmanList() {
    on<GetSalesmanListEvent>((event, emit) async {
      emit(LoadingState());
      var response = await getSalesmans.call("");

      var result = response.fold((l) {
        return ErrorState(msg: l.toString());
      }, (r) {
        salesmanList = r;
        return GetSalesmanLoadedState();
      });
      emit(result);
    });
  }

  _goBackToMainForm() {
    on<MainFormEvent>((event, emit) async {
      emit(LoadingState());
      salesmanList;
      emit(MainFormLoadedState());
    });
  }
}
