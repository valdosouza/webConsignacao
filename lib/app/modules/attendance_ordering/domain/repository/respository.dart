import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/customer_list_by_route_model.dart';
import 'package:appweb/app/modules/Core/data/model/region_model.dart';
import 'package:appweb/app/modules/attendance_ordering/domain/usecase/apply_default_sequence.dart';
import 'package:appweb/app/modules/attendance_ordering/domain/usecase/get_customer.dart';
import 'package:appweb/app/modules/attendance_ordering/domain/usecase/set_default_sequence.dart';
import 'package:appweb/app/modules/sales_route_register/data/model/sales_route_model.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  Future<Either<Failure, List<RegionModel>>> getRegion();

  Future<Either<Failure, List<SalesRouteRegisterModel>>> getRoute();

  Future<Either<Failure, List<CustomerListByRouteModel>>> getCustomer(
      {required ParamsGetCustomer params});

  Future<Either<Failure, void>> setDefaultSequence(
      {required ParamsDefaultSequence params});

  Future<Either<Failure, void>> applyDefaultSequence(
      {required ParamsApplyDefaultSequence params});
}
