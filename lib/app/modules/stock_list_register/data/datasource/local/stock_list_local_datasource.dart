import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/modules/stock_list_register/data/model/stock_list_model.dart';

abstract class StockListLocalDatasource {
  /// Gets the cached [AuthModel] which was gotten the last time
  /// the user had an internet connection.
  ///
  /// Throws [CacheException] if no cached data is present.
  Future<List<StockListModel>> getlist();
}
