import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/customer_list_by_route_model.dart';
import 'package:appweb/app/modules/attendance_by_route/data/datasource/customer_datasource.dart';
import 'package:appweb/app/modules/attendance_by_route/domain/repository/customer_respository.dart';

import 'package:dartz/dartz.dart';

class CustomerRepositoryImpl implements CustomerRepository {
  final CustomerDataSource datasource;

  CustomerRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, List<CustomerListByRouteModel>>> getList(
      {required int tbSalesRouteId}) async {
    try {
      final list = await datasource.getList(
        tbSalesRouteId: tbSalesRouteId,
      );
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, void>> sequence(
      {required int tbSalesRouteId,
      required int tbCustomerId,
      required int sequence}) async {
    try {
      final list = await datasource.sequence(
          tbSalesRouteId: tbSalesRouteId,
          tbCustomerId: tbCustomerId,
          sequence: sequence);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
