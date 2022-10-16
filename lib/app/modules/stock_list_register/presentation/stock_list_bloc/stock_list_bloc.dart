import 'package:appweb/app/modules/stock_list_register/presentation/stock_list_bloc/stock_list_events.dart';
import 'package:appweb/app/modules/stock_list_register/presentation/stock_list_bloc/stock_list_repository.dart';
import 'package:appweb/app/modules/stock_list_register/presentation/stock_list_bloc/stock_list_state.dart';
import 'package:bloc/bloc.dart';

class StockListBloc extends Bloc<StockListEvent, StockListState> {
  final _stocklistRepo = StockListRepository();

  // final StreamController<StockListEvent> _inputClientController = StreamController<StockListEvent>();
  // final StreamController<StockListState> _outputClientController = StreamController<StockListState>();

  // Sink<StockListEvent> get inputClient => _inputClientController.sink;
  // Stream<StockListState> get stream => _outputClientController.stream;

  StockListBloc() : super(StockListInitialState()) {
    // _inputClientController.stream.listen(_mapEventToState);
    on<LoadStockListEvent>(
      (event, emit) =>
          emit(StockListSuccessState(stocklist: _stocklistRepo.loadStocks())),
    );

    on<AddStockListEvent>(
      (event, emit) => emit(StockListSuccessState(
          stocklist: _stocklistRepo.addStock(event.stocklist))),
    );

    on<RemoveStockListEvent>(
      (event, emit) => emit(StockListSuccessState(
          stocklist: _stocklistRepo.removeStock(event.stocklist))),
    );
  }

  // _mapEventToState(StockListEvent event) {
  //   List<Client> clients = [];
  //   if (event is LoadStockListEvent) {
  //     clients = _stocklistRepo.loadClients();
  //   } else if (event is AddStockListEvent) {
  //     clients = _stocklistRepo.addClient(event.client);
  //   } else if (event is RemoveStockListEvent) {
  //     clients = _stocklistRepo.removeClient(event.client);
  //   }
  //   _outputClientController.add(StockListSuccessState(stocklist: clients));
  // }
}
