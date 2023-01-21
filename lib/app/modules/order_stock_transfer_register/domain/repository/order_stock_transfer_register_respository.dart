import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/entity_list_model.dart';
import 'package:appweb/app/modules/Core/data/model/order_status_model.dart';
import 'package:appweb/app/modules/Core/data/model/product_list_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/order_stock_transfer_list_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/order_stock_transfer_main_model.dart';
import 'package:appweb/app/modules/Core/data/model/stock_list_model.dart';
import 'package:dartz/dartz.dart';

abstract class OrderStockTransferRegisterRepository {
  Future<Either<Failure, List<OrderStockTransferListModel>>> getList();
  Future<Either<Failure, OrderStockTransferMainModel>> get(
      {required int orderId});
  Future<Either<Failure, OrderStockTransferListModel>> post(
      {required OrderStockTransferMainModel model});
  Future<Either<Failure, OrderStockTransferListModel>> put(
      {required OrderStockTransferMainModel model});
  Future<Either<Failure, String>> delete({required int id});
  Future<Either<Failure, List<ProductListModel>>> getListProducts();
  Future<Either<Failure, List<StockListModel>>> getListStock();
  Future<Either<Failure, List<EntityListModel>>> getListEntities();
  Future<Either<Failure, String>> closure({required OrderStatusModel model});
  Future<Either<Failure, String>> reopen({required OrderStatusModel model});
}
