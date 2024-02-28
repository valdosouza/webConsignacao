import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/customer_list_by_route_model.dart';
import 'package:appweb/app/modules/Core/data/model/region_model.dart';
import 'package:appweb/app/modules/attendance_ordering/data/datasource/datasource.dart';
import 'package:appweb/app/modules/attendance_ordering/domain/repository/respository.dart';
import 'package:appweb/app/modules/attendance_ordering/domain/usecase/apply_default_sequence.dart';
import 'package:appweb/app/modules/attendance_ordering/domain/usecase/get_customer.dart';
import 'package:appweb/app/modules/attendance_ordering/domain/usecase/set_default_sequence.dart';
import 'package:appweb/app/modules/sales_route_register/data/model/sales_route_model.dart';
import 'package:dartz/dartz.dart';

class RepositoryImpl implements Repository {
  final DataSource datasource;

  RepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, List<RegionModel>>> getRegion() async {
    try {
      final model = await datasource.getRegion();
      return Right(model);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<SalesRouteRegisterModel>>> getRoute() async {
    try {
      final model = await datasource.getRoute();
      return Right(model);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<CustomerListByRouteModel>>> getCustomer(
      {required ParamsGetCustomer params}) async {
    try {
      final model = await datasource.getCustomer(params: params);
      return Right(model);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> setDefaultSequence(
      {required ParamsDefaultSequence params}) async {
    try {
      final list = await datasource.setDefaultSequence(params: params);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> applyDefaultSequence(
      {required ParamsApplyDefaultSequence params}) async {
    try {
      final list = await datasource.applyDefaultSequence(params: params);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
