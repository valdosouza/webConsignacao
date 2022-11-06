import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/product_register/data/model/product_register_model.dart';
import 'package:dartz/dartz.dart';

abstract class ProductRegisterRepository {
  Future<Either<Failure, List<ProductRegisterModel>>> getList(
      {required int id});
  Future<Either<Failure, ProductRegisterModel>> post(
      {required ProductRegisterModel model});
  Future<Either<Failure, ProductRegisterModel>> put(
      {required ProductRegisterModel model});
  Future<Either<Failure, String>> delete({required int id});
}
