import 'dart:collection';

import 'package:appweb/app/modules/cashier_balance/data/model/cashier_balance_model.dart';
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

  HashMap<String, List<CashierStatementModel>> cashierStatement = HashMap();
  List<CashierStatementCustomerModel> customers = List.empty();

  CashierStatementBloc({
    required this.day,
    required this.month,
    required this.statementCustomer,
    required this.customersCharged,
  }) : super(CashierStatementLoadedState()) {
    cashierStatementGetByDay();
    cashierStatementGetByMonth();
    cashierStatementGetByCustomer();
    cashierStatementGetCustomers();
  }

  cashierStatementGetByDay() {
    on<CashierStatementGetByDayMobileEvent>((event, emit) async {
      emit(CashierStatementLoadingState());

      var response = await day.call(event.params);

      var result =
          response.fold((l) => CashierStatementMobileErrorState(), (r) {
        formatByKind(r);
        return CashierStatementMobileSuccessState();
      });

      emit(result);
    });
  }

  cashierStatementGetByMonth() {
    on<CashierStatementGetByMonthMobileEvent>((event, emit) async {
      emit(CashierStatementLoadingState());

      var response = await month.call(event.params);

      var result =
          response.fold((l) => CashierStatementMobileErrorState(), (r) {
        formatByKind(r);
        return CashierStatementMobileSuccessState();
      });

      emit(result);
    });
  }

  cashierStatementGetByCustomer() {
    on<CashierStatementGetByCustomerMobileEvent>((event, emit) async {
      emit(CashierStatementLoadingState());

      var response = await statementCustomer.call(event.params);

      var result =
          response.fold((l) => CashierStatementMobileErrorState(), (r) {
        formatByKind(r);
        return CashierStatementMobileSuccessState();
      });

      emit(result);
    });
  }

  cashierStatementGetCustomers() {
    on<CashierStatementGetCustomersMobileEvent>((event, emit) async {
      emit(CashierStatementLoadingState());

      var response = await customersCharged.call(event.params);

      var result =
          response.fold((l) => CashierStatementCustomerMobileErrorState(), (r) {
        customers = r;
        return CashierStatementCustomerMobileSuccessState();
      });

      emit(result);
    });
  }

  formatByKind(List<CashierStatementModel> data) {
    cashierStatement.clear();
    data.forEach((element) {
      if (cashierStatement.containsKey(element.kind)) {
        cashierStatement[element.kind]!.add(element);
      } else {
        cashierStatement[element.kind] =
            List<CashierStatementModel>.empty(growable: true);
        cashierStatement[element.kind]!.add(element);
      }
    });
  }
}
