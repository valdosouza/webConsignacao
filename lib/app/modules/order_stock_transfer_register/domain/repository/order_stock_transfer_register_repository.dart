import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/order_stock_transfer_register_order_model.dart';
import 'package:dartz/dartz.dart';

abstract class OrderStockTransferRegisterRepository {
  Future<Either<Failure, List<OrderStockTransferRegisterOrderModel>>> getList({
    required int id,
  });

  Future<Either<Failure, OrderStockTransferRegisterOrderModel>> get({
    required int intitutionId,
    required int orderStockId,
  });
  // Future<Either<Failure, OrderProductionRegisterModel>> post(
  //     {required OrderProductionRegisterModel model});
  // Future<Either<Failure, OrderProductionRegisterModel>> put(
  //     {required OrderProductionRegisterModel model});
  // Future<Either<Failure, String>> delete({required int id});
  // Future<Either<Failure, List<ProductModel>>> getListProducts(
  //     {required int id});
  //     Future<Either<Failure, List<StockListModel>>> getListStock(
  //     {required int id});
}