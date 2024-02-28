import 'package:appweb/app/modules/Core/data/model/customer_list_by_route_model.dart';
import 'package:dartz/dartz.dart';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/attendance_ordering/domain/repository/respository.dart';

class GetCustomer
    implements UseCase<List<CustomerListByRouteModel>, ParamsGetCustomer> {
  final Repository repository;

  GetCustomer({required this.repository});

  @override
  Future<Either<Failure, List<CustomerListByRouteModel>>> call(
      ParamsGetCustomer params) async {
    try {
      final list = await repository.getCustomer(params: params);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGetCustomer {
  final int tbRegionId;
  final int tbSalesRouteId;
  ParamsGetCustomer({
    required this.tbRegionId,
    required this.tbSalesRouteId,
  });
}
