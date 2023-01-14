import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/customer_list_model.dart';
import 'package:appweb/app/modules/attendance_by_salesman/data/datasource/customer_datasource.dart';
import 'package:appweb/app/modules/attendance_by_salesman/domain/repository/customer_respository.dart';

import 'package:dartz/dartz.dart';

class CustomerRepositoryImpl implements CustomerRepository {
  final CustomerDataSource datasource;

  CustomerRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, List<CustomerListModel>>> getList() async {
    try {
      final list = await datasource.getList();
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
