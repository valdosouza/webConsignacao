import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/customer_list_model.dart';
import 'package:appweb/app/modules/attendance_by_customer/domain/repository/customer_respository.dart';
import 'package:appweb/app/modules/attendance_by_customer/domain/usecase/customer_get_list.dart';
import 'package:appweb/app/modules/attendance_by_customer/presentation/bloc/attendance_by_customer_bloc.dart';
import 'package:dartz/dartz.dart';

/// Fake repository for attendance by customer tests.
class FakeCustomerRepository implements CustomerRepository {
  FakeCustomerRepository({this.customerList = const []});

  final List<CustomerListModel> customerList;

  @override
  Future<Either<Failure, List<CustomerListModel>>> getList() async =>
      Right(customerList);
}

/// Creates a bloc for widget tests. [customerList] is returned by getList().
AttendanceByCustomerBloc createFakeAttendanceByCustomerBloc({
  List<CustomerListModel>? customerList,
}) {
  final repo = FakeCustomerRepository(
    customerList: customerList ?? [],
  );
  return AttendanceByCustomerBloc(
    getlistCustomer: CustomerGetlist(repository: repo),
  );
}
