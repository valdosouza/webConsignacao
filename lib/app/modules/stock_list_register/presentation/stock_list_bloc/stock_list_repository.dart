import 'package:appweb/app/modules/stock_list_register/data/model/stock_list_model.dart';

class StockListRepository {
  final List<StockListModel> _stocklist = [];

  List<StockListModel> loadStocks() {
    _stocklist.addAll([
      const StockListModel(
        id: 1,
        description: 'Principal',
        active: 'S',
        main: 'S',
        institution: 1,
      ),
      const StockListModel(
        id: 2,
        description: 'Cliente 1',
        active: 'S',
        main: 'N',
        institution: 1,
      ),
      const StockListModel(
        id: 3,
        description: 'Cliente 2',
        active: 'S',
        main: 'N',
        institution: 1,
      ),
    ]);
    return _stocklist;
  }

  List<StockListModel> addStock(StockListModel stock) {
    _stocklist.add(stock);
    return _stocklist;
  }

  List<StockListModel> removeStock(StockListModel stock) {
    _stocklist.remove(stock);
    return _stocklist;
  }
}
