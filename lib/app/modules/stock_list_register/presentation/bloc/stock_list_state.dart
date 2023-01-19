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
  StockListLoadedState({required List<StockListModel> list})
      : super(list: list);
}

class StockListErrorState extends StockListState {
  StockListErrorState({required List<StockListModel> list}) : super(list: list);
}

class StockListInfoPageState extends StockListState {
  StockListInfoPageState({required List<StockListModel> list})
      : super(list: list);
}

class StockListAddSuccessState extends StockListState {
  StockListAddSuccessState({required List<StockListModel> list})
      : super(list: list);
}

class StockListAddErrorState extends StockListState {
  StockListAddErrorState({required List<StockListModel> list})
      : super(list: list);
}

class StockListEditSuccessState extends StockListState {
  StockListEditSuccessState({required List<StockListModel> list})
      : super(list: list);
}

class StockListEditErrorState extends StockListState {
  StockListEditErrorState({required List<StockListModel> list})
      : super(list: list);
}
