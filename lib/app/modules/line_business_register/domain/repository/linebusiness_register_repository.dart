import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/line_business_register/data/model/linebusiness_model.dart';
import 'package:dartz/dartz.dart';

abstract class LinebusinessRegisterRepository {
  Future<Either<Failure, List<LinebusinessModel>>> getList();
  Future<Either<Failure, LinebusinessModel>> post(
      {required LinebusinessModel model});
  Future<Either<Failure, LinebusinessModel>> put(
      {required LinebusinessModel model});
  Future<Either<Failure, String>> delete({required int id});
}
