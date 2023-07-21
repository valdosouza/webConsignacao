import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/customer_list_by_route_model.dart';
import 'package:appweb/app/modules/attendance_by_route/domain/usecase/customer_get_list.dart';
import 'package:appweb/app/modules/attendance_by_route/domain/usecase/customer_set_turn_back.dart';
import 'package:dartz/dartz.dart';

abstract class CustomerRepository {
  Future<Either<Failure, List<CustomerListByRouteModel>>> getList(
      {required ParamsGetListCustomerByRoute params});
  Future<Either<Failure, void>> sequence(
      {required int tbSalesRouteId,
      required int tbCustomerId,
      required int sequence});
  Future<Either<Failure, String>> setTurnBack(
      {required ParamsSetTurnBack params});
}
