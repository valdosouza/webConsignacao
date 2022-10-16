import 'package:appweb/app/modules/stock_list_register/data/model/stock_list_model.dart';

abstract class StockListEvent {}

class LoadStockListEvent extends StockListEvent {}

class AddStockListEvent extends StockListEvent {
  StockListModel stocklist;

  AddStockListEvent({
    required this.stocklist,
  });
}

class RemoveStockListEvent extends StockListEvent {
  StockListModel stocklist;

  RemoveStockListEvent({
    required this.stocklist,
  });
}
