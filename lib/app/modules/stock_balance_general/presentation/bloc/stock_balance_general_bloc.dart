import 'package:appweb/app/modules/Core/data/model/stock_balance_model.dart';
import 'package:appweb/app/modules/stock_balance_general/domain/usecase/stock_balance_general_getlist.dart';
import 'package:appweb/app/modules/stock_balance_general/presentation/bloc/stock_balance_general_event.dart';
import 'package:appweb/app/modules/stock_balance_general/presentation/bloc/stock_balance_general_state.dart';
import 'package:bloc/bloc.dart';

class StockBalanceGeneralBloc
    extends Bloc<StockBalanceGeneralEvent, StockBalanceGeneralState> {
  final StockBalanceGeneralGetlist getlist;

  List<StockBalanceModel> stockBalance = [];

  StockBalanceGeneralBloc({
    required this.getlist,
  }) : super(StockBalanceGeneralLoadingState()) {
    getList();
    searchEvent();
  }

  getList() {
    on<StockBalanceGeneralGetListEvent>((event, emit) async {
      emit(StockBalanceGeneralLoadingState());

      var response = await getlist.call(
          const ParamsGetListStockBalance(institutionId: 1, salesmanId: 1));

      response.fold(
          (l) => emit(StockBalanceGeneralErrorState(list: stockBalance)), (r) {
        stockBalance = r;
        emit(StockBalanceGeneralLoadedState(list: r));
      });
    });
  }

  searchEvent() {
    on<StockBalanceGeneralSearchEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        var stockBalanceSearched = stockBalance.where((element) {
          String name = element.nameMerchandise;
          return (name
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim()));
        }).toList();
        if (stockBalanceSearched.isNotEmpty) {
          emit(StockBalanceGeneralLoadedState(list: stockBalanceSearched));
        } else {
          emit(StockBalanceGeneralLoadedState(list: []));
        }
      } else {
        emit(StockBalanceGeneralLoadedState(list: stockBalance));
      }
    });
  }
}
