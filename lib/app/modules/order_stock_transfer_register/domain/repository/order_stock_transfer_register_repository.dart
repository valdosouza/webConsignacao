import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/entity/product_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/entity_list_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/order_stock_transfer_register_order_model.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/data/model/stock_list_model.dart';
import 'package:dartz/dartz.dart';

abstract class OrderStockTransferRegisterRepository {
  Future<Either<Failure, List<OrderStockTransferRegisterOrderModel>>> getList({
    required int id,
  });
  Future<Either<Failure, List<ProductModel>>> getListProduct({
    required int institutionId,
  });

  Future<Either<Failure, OrderStockTransferRegisterOrderModel>> get({
    required int tbInstitutionId,
    required int orderStockId,
  });
  Future<Either<Failure, OrderStockTransferRegisterOrderModel>> post(
      {required OrderStockTransferRegisterOrderModel model});
  Future<Either<Failure, OrderStockTransferRegisterOrderModel>> put(
      {required OrderStockTransferRegisterOrderModel model});
  Future<Either<Failure, String>> delete({required int id});
  Future<Either<Failure, List<StockListModel>>> getListStock(
      {required int institutionId});
  Future<Either<Failure, List<CustomerListModel>>> getListEntity(
      {required int institutionId});
}
