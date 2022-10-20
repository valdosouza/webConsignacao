import 'package:appweb/app/modules/stock_list_register/data/model/stock_list_model.dart';

abstract class StockListState {
  List<StockListModel> stocklist;

  StockListState({
    required this.stocklist,
  });
}

class StockListInitialState extends StockListState {
  StockListInitialState() : super(stocklist: []);
}

class StockListSuccessState extends StockListState {
  StockListSuccessState({required List<StockListModel> stocklist})
      : super(stocklist: stocklist);
}

class StockListErrorState extends StockListState {
  StockListErrorState() : super(stocklist: []);
}
