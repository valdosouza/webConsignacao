import 'package:appweb/app/modules/cashier_balance/data/model/cashier_balance_model.dart';
import 'package:bloc/bloc.dart';
import '../../domain/entity/cashier_balance_entity.dart';
import '../../domain/usecase/cashier_balance_getlist.dart';
import 'cashier_balance_event.dart';
import 'cashier_balance_state.dart';

class CashierBalanceBloc extends Bloc<CashierBalanceEvent, CashierBalanceState> {
  final Getlist getlist;

  CashierBalanceEntity cashierBalance = CashierBalanceModel.empty();
  CashierBalanceBloc({required this.getlist}) : super(CashierBalanceLoadingState()) {
    getlistMobile();
  }

  getlistMobile() {
    on<CashierBalanceMobileEvent>((event, emit) async {
      emit(CashierBalanceLoadingState());

      var response = await getlist.call(ParamsGetlist(id: 1, date: event.date, userId: event.userId));

      var result =
          response.fold((l) => CashierBalanceMobileErrorState(model: null), (r) {
        cashierBalance = r;
        return CashierBalanceMobileSuccessState(model: cashierBalance);
      });

      emit(result);
    });
  }
}
