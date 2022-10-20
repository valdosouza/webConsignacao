import 'package:appweb/app/modules/stock_list_register/data/model/stock_list_model.dart';
import 'package:appweb/app/modules/stock_list_register/domain/usescases/stock_list_getlist.dart';
import 'package:appweb/app/modules/stock_list_register/presentation/bloc/stock_list_events.dart';
import 'package:appweb/app/modules/stock_list_register/presentation/bloc/stock_list_state.dart';
import 'package:bloc/bloc.dart';

class StockListBloc extends Bloc<StockListEvent, StockListState> {
  final StockListGetlist getlist;

  List<StockListModel> clients = [];

  StockListBloc({
    required this.getlist,
  }) : super(StockListInitialState()) {
    on<LoadStockListEvent>((event, emit) async {
      StockListInitialState();
      var response = await getlist.call(const Params(institutionId: 1));
      var result = response.fold(
        (l) => StockListErrorState(),
        (r) {
          clients = r;
          return StockListSuccessState(stocklist: r);
        },
      );
      emit(result);
    });

    on<SearchClientEvent>((event, emit) async {
      if (event.search.isNotEmpty) {
        var clienstSearched = clients.where((element) {
          String name = element.description;
          return name
              .toLowerCase()
              .trim()
              .contains(event.search.toLowerCase().trim());
        }).toList();
        if (clienstSearched.isEmpty) {}
        emit(StockListSuccessState(stocklist: clienstSearched));
      } else {
        emit(StockListSuccessState(stocklist: clients));
      }
    });
  }
}
