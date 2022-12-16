import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/entity_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/order_stock_adjustment_register_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/product_model.dart';
import 'package:appweb/app/modules/order_stock_adjustment_register/data/model/stock_list_model.dart';
import 'package:dartz/dartz.dart';

abstract class OrderStockAdjustmentRegisterRepository {
  Future<Either<Failure, List<OrderStockAdjustmentRegisterModel>>> getList(
      {required int id});
  Future<Either<Failure, OrderStockAdjustmentRegisterModel>> get(
      {required int intitutionId, required int productId});
  Future<Either<Failure, OrderStockAdjustmentRegisterModel>> post(
      {required OrderStockAdjustmentRegisterModel model});
  Future<Either<Failure, OrderStockAdjustmentRegisterModel>> put(
      {required OrderStockAdjustmentRegisterModel model});
  Future<Either<Failure, String>> delete({required int id});
  Future<Either<Failure, List<ProductModel>>> getListProducts(
      {required int id});
      Future<Either<Failure, List<StockListModel>>> getListStock(
      {required int id});
      Future<Either<Failure, List<EntityModel>>> getListEntities();
}
