import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/entity_list_model.dart';
import 'package:appweb/app/modules/Core/data/model/order_status_model.dart';
import 'package:appweb/app/modules/Core/data/model/product_list_model.dart';
import 'package:appweb/app/modules/order_bonus_register/data/model/order_bonus_register_model.dart';
import 'package:appweb/app/modules/Core/data/model/stock_list_model.dart';
import 'package:dartz/dartz.dart';

abstract class OrderBonusRegisterRepository {
  Future<Either<Failure, List<OrderBonusRegisterModel>>> getList();
  Future<Either<Failure, OrderBonusRegisterModel>> get(
      {required int productId});
  Future<Either<Failure, OrderBonusRegisterModel>> post(
      {required OrderBonusRegisterModel model});
  Future<Either<Failure, OrderBonusRegisterModel>> put(
      {required OrderBonusRegisterModel model});
  Future<Either<Failure, String>> delete({required int id});
  Future<Either<Failure, List<ProductListModel>>> getListProducts();
  Future<Either<Failure, List<StockListModel>>> getListStock();
  Future<Either<Failure, List<EntityListModel>>> getListEntities();
  Future<Either<Failure, String>> closure({required OrderStatusModel model});
  Future<Either<Failure, String>> reopen({required OrderStatusModel model});
}
