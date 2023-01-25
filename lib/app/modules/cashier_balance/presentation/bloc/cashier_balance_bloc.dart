import 'package:appweb/app/core/shared/helpers/local_storage.dart';
import 'package:appweb/app/core/shared/local_storage_key.dart';
import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/cashier_balance/data/model/cashier_balance_model.dart';
import 'package:bloc/bloc.dart';

import '../../domain/usecase/cashier_balance_get.dart';
import 'cashier_balance_event.dart';
import 'cashier_balance_state.dart';

class CashierBalanceBloc
    extends Bloc<CashierBalanceEvent, CashierBalanceState> {
  final CashierBalanceGet cashierbalance;

  CashierBalanceModel cashierBalance = CashierBalanceModel.empty();
  CashierBalanceBloc({required this.cashierbalance})
      : super(CashierBalanceLoadingState()) {
    cashierBalanceGet();
    getCurrentData();
  }

  getCurrentData() {
    on<CashierBalanceGetDateEvent>((event, emit) async {
      emit(CashierBalanceLoadingState());
      var dtCashier = await LocalStorageService.instance
          .get(key: LocalStorageKey.dtCashier);
      if (dtCashier == "") {
        dtCashier = CustomDate.newDate();
      }
      cashierBalance.dtRecord = dtCashier;
      emit(CashierBalanceGetCurrentDateSucessState());
    });
  }

  cashierBalanceGet() {
    on<CashierBalanceMobileEvent>((event, emit) async {
      emit(CashierBalanceLoadingState());

      var response =
          await cashierbalance.call(ParamsCashierBalance(date: event.date));

      var result = response.fold((l) => CashierBalanceMobileErrorState(), (r) {
        cashierBalance = r;
        return CashierBalanceMobileSuccessState(model: cashierBalance);
      });

      emit(result);
    });
  }
}
