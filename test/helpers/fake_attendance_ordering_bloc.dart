import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/customer_list_by_route_model.dart';
import 'package:appweb/app/modules/Core/data/model/region_model.dart';
import 'package:appweb/app/modules/attendance_ordering/domain/repository/respository.dart';
import 'package:appweb/app/modules/attendance_ordering/domain/usecase/apply_default_sequence.dart';
import 'package:appweb/app/modules/attendance_ordering/domain/usecase/get_customer.dart';
import 'package:appweb/app/modules/attendance_ordering/domain/usecase/get_region.dart';
import 'package:appweb/app/modules/attendance_ordering/domain/usecase/get_route.dart';
import 'package:appweb/app/modules/attendance_ordering/domain/usecase/set_default_sequence.dart';
import 'package:appweb/app/modules/attendance_ordering/presentation/bloc/bloc.dart';
import 'package:appweb/app/modules/sales_route_register/data/model/sales_route_model.dart';
import 'package:dartz/dartz.dart';

/// Fake repository for attendance_ordering tests.
class FakeAttendanceOrderingRepository implements Repository {
  FakeAttendanceOrderingRepository({
    this.regionList = const [],
    this.routeList = const [],
    this.customerList = const [],
  });

  final List<RegionModel> regionList;
  final List<SalesRouteRegisterModel> routeList;
  final List<CustomerListByRouteModel> customerList;

  @override
  Future<Either<Failure, List<RegionModel>>> getRegion() async =>
      Right(regionList);

  @override
  Future<Either<Failure, List<SalesRouteRegisterModel>>> getRoute() async =>
      Right(routeList);

  @override
  Future<Either<Failure, List<CustomerListByRouteModel>>> getCustomer(
      {required ParamsGetCustomer params}) async =>
      Right(customerList);

  @override
  Future<Either<Failure, void>> setDefaultSequence(
      {required ParamsDefaultSequence params}) async =>
      const Right(null);

  @override
  Future<Either<Failure, void>> applyDefaultSequence(
      {required ParamsApplyDefaultSequence params}) async =>
      const Right(null);
}

/// Creates a bloc for widget tests.
AttendanceOrderingBloc createFakeAttendanceOrderingBloc({
  List<RegionModel>? regionList,
  List<SalesRouteRegisterModel>? routeList,
  List<CustomerListByRouteModel>? customerList,
}) {
  final repo = FakeAttendanceOrderingRepository(
    regionList: regionList ?? [],
    routeList: routeList ?? [],
    customerList: customerList ?? [],
  );
  return AttendanceOrderingBloc(
    getRegion: GetRegion(repository: repo),
    getRoute: GetRoute(repository: repo),
    getCustomer: GetCustomer(repository: repo),
    setDefaultSequence: SetDefaultSequence(repository: repo),
    applytDefaultSequence: ApplytDefaultSequence(repository: repo),
  );
}
