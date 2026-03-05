import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/customer_list_by_route_model.dart';
import 'package:appweb/app/modules/Core/data/model/sales_route_list_model.dart';
import 'package:appweb/app/modules/attendance_by_route/domain/repository/customer_respository.dart';
import 'package:appweb/app/modules/attendance_by_route/domain/repository/sales_route_repository.dart';
import 'package:appweb/app/modules/attendance_by_route/domain/usecase/customer_get_list.dart';
import 'package:appweb/app/modules/attendance_by_route/domain/usecase/customer_sequence.dart';
import 'package:appweb/app/modules/attendance_by_route/domain/usecase/customer_set_turn_back.dart';
import 'package:appweb/app/modules/attendance_by_route/domain/usecase/sales_route_get_list.dart';
import 'package:appweb/app/modules/attendance_by_route/presentation/bloc/attendance_by_route_bloc.dart';
import 'package:dartz/dartz.dart';

/// Fake repository for sales route list in attendance_by_route tests.
class FakeSalesRouteRepository implements SalesRouteRepository {
  FakeSalesRouteRepository({this.salesRouteList = const []});

  final List<SalesRouteListModel> salesRouteList;

  @override
  Future<Either<Failure, List<SalesRouteListModel>>> getList() async =>
      Right(salesRouteList);
}

/// Fake repository for customer list by route in attendance_by_route tests.
class FakeCustomerRepositoryRoute implements CustomerRepository {
  FakeCustomerRepositoryRoute({this.customerList = const []});

  final List<CustomerListByRouteModel> customerList;

  @override
  Future<Either<Failure, List<CustomerListByRouteModel>>> getList(
      {required ParamsGetListCustomerByRoute params}) async =>
      Right(customerList);

  @override
  Future<Either<Failure, void>> sequence(
      {required ParamsSequenceCustomer params}) async =>
      const Right(null);

  @override
  Future<Either<Failure, String>> setTurnBack(
      {required ParamsSetTurnBack params}) async =>
      const Right('');
}

/// Creates a bloc for widget tests. [salesRouteList] and [customerList] are
/// returned by the fake repositories.
AttendanceByRouteBloc createFakeAttendanceByRouteBloc({
  List<SalesRouteListModel>? salesRouteList,
  List<CustomerListByRouteModel>? customerList,
}) {
  final salesRepo = FakeSalesRouteRepository(
    salesRouteList: salesRouteList ?? [],
  );
  final customerRepo = FakeCustomerRepositoryRoute(
    customerList: customerList ?? [],
  );
  return AttendanceByRouteBloc(
    getlistSalesRoute: SalesRouteGetlist(repository: salesRepo),
    getlistCustomer: CustomerGetlist(repository: customerRepo),
    sequence: CustomerSequence(repository: customerRepo),
    customerSetTurnBack: CustomerSetTurnBack(repository: customerRepo),
  );
}
