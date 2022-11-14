import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/product_register/data/model/product_register_main_model.dart';
import 'package:appweb/app/modules/product_register/data/model/product_register_model.dart';
import 'package:dartz/dartz.dart';

abstract class ProductRegisterRepository {
  Future<Either<Failure, List<ProductRegisterModel>>> getList(
      {required int id});
  Future<Either<Failure, ProductRegisterMainModel>> get(
      {required int intitutionId, required int productId});
  Future<Either<Failure, ProductRegisterMainModel>> post(
      {required ProductRegisterMainModel model});
  Future<Either<Failure, ProductRegisterMainModel>> put(
      {required ProductRegisterMainModel model});
  Future<Either<Failure, String>> delete({required int id});
}
