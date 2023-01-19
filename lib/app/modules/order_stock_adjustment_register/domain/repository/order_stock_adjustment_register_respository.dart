import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/entity_list_model.dart';
import 'package:appweb/app/modules/Core/data/model/product_list_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/order_stock_adjustment_register_model.dart';
import 'package:appweb/app/modules/Core/data/model/stock_list_model.dart';
import 'package:dartz/dartz.dart';

abstract class OrderStockAdjustmentRegisterRepository {
  Future<Either<Failure, List<OrderStockAdjustmentRegisterModel>>> getList();
  Future<Either<Failure, OrderStockAdjustmentRegisterModel>> get(
      {required int productId});
  Future<Either<Failure, OrderStockAdjustmentRegisterModel>> post(
      {required OrderStockAdjustmentRegisterModel model});
  Future<Either<Failure, OrderStockAdjustmentRegisterModel>> put(
      {required OrderStockAdjustmentRegisterModel model});
  Future<Either<Failure, String>> delete({required int id});
  Future<Either<Failure, List<ProductListModel>>> getListProducts();
  Future<Either<Failure, List<StockListModel>>> getListStock();
  Future<Either<Failure, List<EntityListModel>>> getListEntities();
}
