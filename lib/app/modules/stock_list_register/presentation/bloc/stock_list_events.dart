import 'package:appweb/app/modules/stock_list_register/data/model/stock_list_model.dart';

abstract class StockListEvent {}

class LoadStockListEvent extends StockListEvent {}

class AddStockListEvent extends StockListEvent {
  StockListModel stock;

  AddStockListEvent({
    required this.stock,
  });
}

class EditStockListEvent extends StockListEvent {
  StockListModel stock;

  EditStockListEvent({
    required this.stock,
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

class StockListInterationEvent extends StockListEvent {
  StockListModel? stock;

  StockListInterationEvent({
    this.stock,
  });
}
