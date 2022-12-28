import 'package:appweb/app/modules/Core/data/model/stock_balance_model.dart';
import 'package:appweb/app/modules/stock_balance_general/domain/usecase/stock_balance_general_getlist.dart';
import 'package:appweb/app/modules/stock_balance_general/presentation/bloc/stock_balance_general_event.dart';
import 'package:appweb/app/modules/stock_balance_general/presentation/bloc/stock_balance_general_state.dart';
import 'package:bloc/bloc.dart';

class StockBalanceGeneralBloc
    extends Bloc<StockBalanceGeneralEvent, StockBalanceGeneralState> {
  final StockBalanceGeneralGetlist getlist;

  List<StockBalanceModel> sotckBalance = [];

  StockBalanceGeneralBloc({
    required this.getlist,
  }) : super(StockBalanceGeneralLoadingState()) {
    getList();
  }

  getList() {
    on<StockBalanceGeneralGetListEvent>((event, emit) async {
      emit(StockBalanceGeneralLoadingState());

      var response =
          await getlist.call(const ParamsGetListStockBalance(institutionId: 1, salesmanId: 1));

      response.fold(
          (l) => emit(StockBalanceGeneralErrorState(list: sotckBalance)), (r) {
        sotckBalance = r;
        emit(StockBalanceGeneralLoadedState(list: r));
      });
    });
  }
}
