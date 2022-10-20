import 'package:appweb/app/modules/stock_list_register/data/model/stock_list_model.dart';

abstract class StockListEvent {}

class LoadStockListEvent extends StockListEvent {}

class AddStockListEvent extends StockListEvent {
  StockListModel stocklist;

  AddStockListEvent({
    required this.stocklist,
  });
}

class SearchStockEvent extends StockListEvent {
  String search;

  SearchStockEvent({
    required this.search,
  });
}

class DeleteStockEvent extends StockListEvent {
  int stockId;

  DeleteStockEvent({
    required this.stockId,
  });
}
