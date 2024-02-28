import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/customer_list_by_route_model.dart';
import 'package:appweb/app/modules/attendance_by_route/data/datasource/customer_datasource.dart';
import 'package:appweb/app/modules/attendance_by_route/domain/repository/customer_respository.dart';
import 'package:appweb/app/modules/attendance_by_route/domain/usecase/customer_get_list.dart';
import 'package:appweb/app/modules/attendance_by_route/domain/usecase/customer_sequence.dart';
import 'package:appweb/app/modules/attendance_by_route/domain/usecase/customer_set_turn_back.dart';

import 'package:dartz/dartz.dart';

class CustomerRepositoryImpl implements CustomerRepository {
  final CustomerDataSource datasource;

  CustomerRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, List<CustomerListByRouteModel>>> getList(
      {required ParamsGetListCustomerByRoute params}) async {
    try {
      final list = await datasource.getList(params: params);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> sequence(
      {required ParamsSequenceCustomer params}) async {
    try {
      final list = await datasource.sequence(params: params);

      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, String>> setTurnBack(
      {required ParamsSetTurnBack params}) async {
    try {
      final result = await datasource.setTurnBack(params: params);
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
