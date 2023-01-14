import 'package:dartz/dartz.dart';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/customer_list_by_route_model.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/attendance_by_route/domain/repository/customer_respository.dart';

class CustomerGetlist
    implements UseCase<List<CustomerListByRouteModel>, ParamsGetListCustomer> {
  final CustomerRepository repository;

  CustomerGetlist({required this.repository});

  @override
  Future<Either<Failure, List<CustomerListByRouteModel>>> call(
      ParamsGetListCustomer params) async {
    try {
      final list =
          await repository.getList(tbSalesRouteId: params.tbSalesRouteId);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGetListCustomer {
  int tbSalesRouteId;
  ParamsGetListCustomer({required this.tbSalesRouteId});
}
