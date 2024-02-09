import 'package:appweb/app/modules/Core/data/model/stock_list_model.dart';

abstract class StockListState {
  List<StockListModel> list;

  StockListState({
    required this.list,
  });
}

class StockListLoadingState extends StockListState {
  StockListLoadingState() : super(list: []);
}

class StockListLoadedState extends StockListState {
  StockListLoadedState({required super.list});
}

class StockListErrorState extends StockListState {
  StockListErrorState({required super.list});
}

class StockListInfoPageState extends StockListState {
  StockListInfoPageState({required super.list});
}

class StockListAddSuccessState extends StockListState {
  StockListAddSuccessState({required super.list});
}

class StockListAddErrorState extends StockListState {
  StockListAddErrorState({required super.list});
}

class StockListEditSuccessState extends StockListState {
  StockListEditSuccessState({required super.list});
}

class StockListEditErrorState extends StockListState {
  StockListEditErrorState({required super.list});
}
