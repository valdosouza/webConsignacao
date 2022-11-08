import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/sales_route_register/data/model/sales_route_model.dart';
import 'package:dartz/dartz.dart';

abstract class SalesRouteRegisterRepository {
  Future<Either<Failure, List<SalesRouteRegisterModel>>> getList(
      {required int institutionId});
  Future<Either<Failure, SalesRouteRegisterModel>> post(
      {required SalesRouteRegisterModel model});
  Future<Either<Failure, SalesRouteRegisterModel>> put(
      {required SalesRouteRegisterModel model});
  Future<Either<Failure, String>> delete({required int id});
}
