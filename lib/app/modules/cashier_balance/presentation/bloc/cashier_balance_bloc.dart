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
