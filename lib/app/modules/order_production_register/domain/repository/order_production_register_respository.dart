import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/product_list_model.dart';
import 'package:appweb/app/modules/order_production_register/data/model/order_production_register_model.dart';
import 'package:appweb/app/modules/order_production_register/data/model/stock_list_model.dart';
import 'package:dartz/dartz.dart';

abstract class OrderProductionRegisterRepository {
  Future<Either<Failure, List<OrderProductionRegisterModel>>> getList();
  Future<Either<Failure, OrderProductionRegisterModel>> get(
      {required int productId});
  Future<Either<Failure, OrderProductionRegisterModel>> post(
      {required OrderProductionRegisterModel model});
  Future<Either<Failure, OrderProductionRegisterModel>> put(
      {required OrderProductionRegisterModel model});
  Future<Either<Failure, String>> delete({required int id});
  Future<Either<Failure, List<ProductListModel>>> getListProducts();
  Future<Either<Failure, List<StockListModel>>> getListStock();
}
