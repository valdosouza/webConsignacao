import 'package:appweb/app/modules/Core/data/model/stock_balance_model.dart';
import 'package:appweb/app/modules/stock_balance_salesman/domain/usecase/stock_balance_salesman_getlist.dart';
import 'package:appweb/app/modules/stock_balance_salesman/presentation/bloc/stock_balance_salesman_event.dart';
import 'package:appweb/app/modules/stock_balance_salesman/presentation/bloc/stock_balance_salesman_state.dart';
import 'package:bloc/bloc.dart';

class StockBalanceSalesmanBloc
    extends Bloc<StockBalanceSalesmanEvent, StockBalanceSalesmanState> {
  final StockBalanceSalesmanGetlist getlist;

  List<StockBalanceModel> sotckBalance = [];

  StockBalanceSalesmanBloc({
    required this.getlist,
  }) : super(StockBalanceSalesmanLoadingState()) {
    getList();
  }

  getList() {
    on<StockBalanceSalesmanGetListEvent>((event, emit) async {
      emit(StockBalanceSalesmanLoadingState());

      var response =
          await getlist.call(const ParamsGetListStockBalance(institutionId: 1, salesmanId: 1));

      response.fold(
          (l) => emit(StockBalanceSalesmanErrorState(list: sotckBalance)), (r) {
        sotckBalance = r;
        emit(StockBalanceSalesmanLoadedState(list: r));
      });
    });
  }
}
