import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/customer_list_model.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/attendance_by_route/domain/repository/customer_respository.dart';
import 'package:dartz/dartz.dart';

class CustomerGetlist
    implements UseCase<List<CustomerListModel>, ParamsGetListCustomer> {
  final CustomerRepository repository;

  CustomerGetlist({required this.repository});

  @override
  Future<Either<Failure, List<CustomerListModel>>> call(
      ParamsGetListCustomer params) async {
    try {
      final list = await repository.getList(
          tbInstitutionId: params.tbInstitutionId,
          tbSalesRouteId: params.tbSalesRouteId);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGetListCustomer {
  int tbInstitutionId;
  int tbSalesRouteId;
  ParamsGetListCustomer(
      {required this.tbInstitutionId, required this.tbSalesRouteId});
}
