import 'package:appweb/app/core/shared/helpers/local_storage.dart';
import 'package:appweb/app/core/shared/local_storage_key.dart';
import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/cashier_statement_customer_model.dart';
import 'package:appweb/app/modules/cashier_statement/data/model/cashier_statement_model.dart';
import 'package:appweb/app/modules/cashier_statement/domain/usecase/cashier_statement_get_by_customer.dart';
import 'package:appweb/app/modules/cashier_statement/domain/usecase/cashier_statement_get_by_day.dart';
import 'package:appweb/app/modules/cashier_statement/domain/usecase/cashier_statement_get_by_month.dart';
import 'package:appweb/app/modules/cashier_statement/domain/usecase/cashier_statement_get_customer.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_event.dart';
import 'package:appweb/app/modules/cashier_statement/presentation/bloc/cashier_statement_state.dart';
import 'package:bloc/bloc.dart';

class CashierStatementBloc
    extends Bloc<CashierStatementEvent, CashierStatementState> {
  final CashierStatementGetByDay day;
  final CashierStatementGetByMonth month;
  final CashierStatementGetByCustomer statementCustomer;
  final CashierStatementGetCustomers customersCharged;

  List<CashierStatementModel> cashierStatement = List.empty();
  List<CashierStatementCustomerModel> customers = List.empty();
  int customerIndex = 0;
  String dtCashierToday = "";
  String dtCashierMonth = "";

  CashierStatementBloc({
    required this.day,
    required this.month,
    required this.statementCustomer,
    required this.customersCharged,
  }) : super(LoadedState()) {
    cashierStatementGetByDay();
    cashierStatementGetByMonth();
    cashierStatementGetByCustomer();
    cashierStatementGetCustomers();
    getCurrentData();
  }

  getCurrentData() {
    on<GetCurrentDateEvent>((event, emit) async {
      emit(LoadingState());
      dtCashierToday = await LocalStorageService.instance
          .get(key: LocalStorageKey.dtCashier);
      if (dtCashierToday == "") {
        dtCashierToday = CustomDate.newDate();
      }
      dtCashierMonth = CustomDate().getMonth(dtCashierToday);
      emit(GetCurrentDateSucessState());
    });
  }

  cashierStatementGetByDay() {
    on<CashierStatementGetByDayMobileEvent>((event, emit) async {
      emit(LoadingState());

      var response = await day.call(event.params);

      var result = response.fold((l) => MobileErrorState(), (r) {
        cashierStatement = r;
        return MobileSuccessState();
      });

      emit(result);
    });
  }

  cashierStatementGetByMonth() {
    on<CashierStatementGetByMonthMobileEvent>((event, emit) async {
      emit(LoadingState());

      var response = await month.call(event.params);

      var result = response.fold((l) => MobileErrorState(), (r) {
        cashierStatement = r;
        return MobileSuccessState();
      });

      emit(result);
    });
  }

  cashierStatementGetByCustomer() {
    on<CashierStatementGetByCustomerMobileEvent>((event, emit) async {
      emit(LoadingState());
      var dtCashier = await LocalStorageService.instance
          .get(key: LocalStorageKey.dtCashier);
      event.params.date = CustomDate.formatDateOut(dtCashier);
      var response = await statementCustomer.call(event.params);

      var result = response.fold((l) => MobileErrorState(), (r) {
        cashierStatement = r;
        return ByCustomerState();
      });

      emit(result);
    });
  }

  cashierStatementGetCustomers() {
    on<CashierStatementGetCustomersMobileEvent>((event, emit) async {
      emit(LoadingState());
      var dtCashier = await LocalStorageService.instance
          .get(key: LocalStorageKey.dtCashier);

      event.params.date = CustomDate.formatDateOut(dtCashier);
      var response = await customersCharged.call(event.params);

      var result = response.fold((l) => CustomerMobileErrorState(), (r) {
        customers = r;
        return CustomerMobileSuccessState();
      });

      emit(result);
    });
  }
}
