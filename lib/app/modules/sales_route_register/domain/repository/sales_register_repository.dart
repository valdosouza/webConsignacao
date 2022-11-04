import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/sales_route_register/data/models/sales_model.dart';
import 'package:dartz/dartz.dart';

abstract class SalesRepository {
  Future<Either<Failure, SalesModel>> post({
    required SalesModel model,
  });
  Future<Either<Failure, List<SalesModel>>> getList(
      {required int institutionId});

  Future<Either<Failure, String>> put({required SalesModel model});
  Future<Either<Failure, String>> delete({required int institutionId});
}
