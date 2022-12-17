import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/attendance_by_route/data/datasource/customer_datasource.dart';
import 'package:appweb/app/modules/attendance_by_route/domain/repository/customer_respository.dart';
import 'package:appweb/app/modules/Core/data/model/customer_list_model.dart';
import 'package:dartz/dartz.dart';

class CustomerRepositoryImpl implements CustomerRepository {
  final CustomerDataSource datasource;

  CustomerRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, List<CustomerListModel>>> getList(
      {required int tbInstitutionId, required int tbSalesRouteId}) async {
    try {
      final list = await datasource.getList(
        tbInstitutionId: tbInstitutionId,
        tbSalesRouteId: tbSalesRouteId,
      );
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
