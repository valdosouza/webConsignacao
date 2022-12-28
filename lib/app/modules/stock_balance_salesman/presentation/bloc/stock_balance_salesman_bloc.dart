import 'package:appweb/app/modules/Core/data/model/stock_balance_model.dart';
import 'package:appweb/app/modules/stock_balance_salesman/domain/usecase/stock_balance_salesman_getlist.dart';
import 'package:appweb/app/modules/stock_balance_salesman/presentation/bloc/stock_balance_salesman_event.dart';
import 'package:appweb/app/modules/stock_balance_salesman/presentation/bloc/stock_balance_salesman_state.dart';
import 'package:bloc/bloc.dart';

class StockBalanceSalesmanBloc
    extends Bloc<StockBalanceSalesmanEvent, StockBalanceSalesmanState> {
  final StockBalanceSalesmanGetlist getlist;

  List<StockBalanceModel> stockBalance = [];

  StockBalanceSalesmanBloc({
    required this.getlist,
  }) : super(StockBalanceSalesmanLoadingState()) {
    getList();
    searchEvent();
  }

  getList() {
    on<StockBalanceSalesmanGetListEvent>((event, emit) async {
      emit(StockBalanceSalesmanLoadingState());

      var response =
          await getlist.call(const ParamsGetListStockBalance(institutionId: 1, salesmanId: 1));

      response.fold(
          (l) => emit(StockBalanceSalesmanErrorState(list: stockBalance)), (r) {
        stockBalance = r;
        emit(StockBalanceSalesmanLoadedState(list: r));
      });
    });
  }

   searchEvent() {
    on<StockBalanceSalesmanSearchEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        var stockBalanceSearched = stockBalance.where((element) {
          String name = element.nameProduct;
          return (name
                  .toLowerCase()
                  .trim()
                  .contains(event.search.toLowerCase().trim())
             );
        }).toList();
        if (stockBalanceSearched.isNotEmpty) {
          emit(StockBalanceSalesmanLoadedState(
              list: stockBalanceSearched));
        } else {
          emit(StockBalanceSalesmanLoadedState(list: []));
        }
      } else {
        emit(StockBalanceSalesmanLoadedState(list: stockBalance));
      }
    });
  }
}
