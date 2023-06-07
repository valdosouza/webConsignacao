import 'package:dartz/dartz.dart';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/customer_list_by_route_model.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/attendance_by_route/domain/repository/customer_respository.dart';

class CustomerGetlist
    implements
        UseCase<List<CustomerListByRouteModel>, ParamsGetListCustomerByRoute> {
  final CustomerRepository repository;

  CustomerGetlist({required this.repository});

  @override
  Future<Either<Failure, List<CustomerListByRouteModel>>> call(
      ParamsGetListCustomerByRoute params) async {
    try {
      final list = await repository.getList(params: params);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGetListCustomerByRoute {
  int tbSalesRouteId;
  String kind;
  String dtRecord;
  ParamsGetListCustomerByRoute({
    required this.tbSalesRouteId,
    required this.kind,
    required this.dtRecord,
  });
}
