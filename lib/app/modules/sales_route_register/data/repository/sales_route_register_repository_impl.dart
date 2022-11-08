import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/sales_route_register/data/datasource/sales_route_register_datasource.dart';
import 'package:appweb/app/modules/sales_route_register/data/model/sales_route_model.dart';
import 'package:appweb/app/modules/sales_route_register/domain/repository/sales_route_register_respository.dart';
import 'package:dartz/dartz.dart';

class SalesRouteRegisterRepositoryImpl implements SalesRouteRegisterRepository {
  final SalesRouteRegisterDataSource datasource;

  SalesRouteRegisterRepositoryImpl({required this.datasource});
  @override
  Future<Either<Failure, String>> delete({required int id}) async {
    try {
      final list = await datasource.delete(id: id);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, SalesRouteRegisterModel>> put(
      {required SalesRouteRegisterModel model}) async {
    try {
      final list = await datasource.put(model: model);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<SalesRouteRegisterModel>>> getList(
      {required int institutionId}) async {
    try {
      final list = await datasource.getlist(institutionId: institutionId);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, SalesRouteRegisterModel>> post(
      {required SalesRouteRegisterModel model}) async {
    try {
      final list = await datasource.post(model: model);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
