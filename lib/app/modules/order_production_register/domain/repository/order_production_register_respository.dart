import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/order_production_register/data/model/order_production_register_model.dart';
import 'package:dartz/dartz.dart';

abstract class OrderProductionRegisterRepository {
  Future<Either<Failure, List<OrderProductionModel>>> getList(
      {required int id});
  // Future<Either<Failure, ProductRegisterMainModel>> get(
  //     {required int intitutionId, required int productId});
  // Future<Either<Failure, ProductRegisterMainModel>> post(
  //     {required ProductRegisterMainModel model});
  // Future<Either<Failure, ProductRegisterMainModel>> put(
  //     {required ProductRegisterMainModel model});
  // Future<Either<Failure, String>> delete({required int id});
}
