import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/customer_list_by_route_model.dart';
import 'package:dartz/dartz.dart';

abstract class CustomerRepository {
  Future<Either<Failure, List<CustomerListByRouteModel>>> getList(
      {required int tbSalesRouteId});
  Future<Either<Failure, void>> sequence(
      {required int tbSalesRouteId,
      required int tbCustomerId,
      required int sequence});
}
