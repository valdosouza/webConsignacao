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
  StockListSuccessState({
    required List<StockListModel> stocklist,
  }) : super(stocklist: stocklist);
}

class StockEditSuccessState extends StockListState {
  StockEditSuccessState({required List<StockListModel> stocklist})
      : super(stocklist: stocklist);
}

class StockAddSuccessState extends StockListState {
  StockAddSuccessState({required List<StockListModel> stocklist})
      : super(stocklist: stocklist);
}

class StockPutErrorState extends StockListState {
  StockPutErrorState({required List<StockListModel> stocklist})
      : super(stocklist: stocklist);
}

class StockAddErrorState extends StockListState {
  StockAddErrorState({required List<StockListModel> stocklist})
      : super(stocklist: stocklist);
}

class StockListErrorState extends StockListState {
  StockListErrorState() : super(stocklist: []);
}

class StockDeleteSuccessState extends StockListState {
  StockDeleteSuccessState({required List<StockListModel> stocklist})
      : super(stocklist: stocklist);
}

class StockListDeleteErrorState extends StockListState {
  StockListDeleteErrorState({required List<StockListModel> stocklist})
      : super(stocklist: stocklist);
}

class InterationPageState extends StockListState {
  final StockListModel? stock;
  InterationPageState({
    required List<StockListModel> stocklist,
    this.stock,
  }) : super(stocklist: stocklist);
}
