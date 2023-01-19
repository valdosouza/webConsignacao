abstract class StockListEvent {}

class StockListGetListEvent extends StockListEvent {}

class StockListSearchEvent extends StockListEvent {
  String search;

  StockListSearchEvent({
    required this.search,
  });
}

class StockListPutEvent extends StockListEvent {
  StockListPutEvent();
}

class StockListPostEvent extends StockListEvent {
  StockListPostEvent();
}

class StockListAddEvent extends StockListEvent {
  StockListAddEvent();
}

class StockListEditEvent extends StockListEvent {
  StockListEditEvent();
}

class SearchStockEvent extends StockListEvent {
  SearchStockEvent();
}
