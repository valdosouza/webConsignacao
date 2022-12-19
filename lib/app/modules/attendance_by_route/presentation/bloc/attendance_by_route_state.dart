import 'package:appweb/app/modules/Core/data/model/customer_list_by_route_model.dart';
import 'package:appweb/app/modules/Core/data/model/sales_route_list_model.dart';

abstract class AttendanceByRouteState {}

/*----------------------------------------------------------------------------*/
abstract class SalesRouteListState extends AttendanceByRouteState {
  List<SalesRouteListModel> salesRouteList;
  SalesRouteListState({
    required this.salesRouteList,
  });
}

class SalesRouteListLoadingState extends SalesRouteListState {
  SalesRouteListLoadingState() : super(salesRouteList: []);
}

class SalesRouteListLoadedState extends SalesRouteListState {
  SalesRouteListLoadedState({required List<SalesRouteListModel> salesRouteList})
      : super(salesRouteList: salesRouteList);
}

class SalesRouteListErrorState extends SalesRouteListState {
  SalesRouteListErrorState({required List<SalesRouteListModel> salesRouteList})
      : super(salesRouteList: salesRouteList);
}

/*----------------------------------------------------------------------------*/
class CustomerListState extends AttendanceByRouteState {
  List<CustomerListByRouteModel> customerList;
  CustomerListState({
    required this.customerList,
  });
}

class CustomerListLoadingState extends CustomerListState {
  CustomerListLoadingState() : super(customerList: []);
}

class CustomerListLoadedState extends CustomerListState {
  CustomerListLoadedState(
      {required List<CustomerListByRouteModel> customerList})
      : super(customerList: customerList);
}

class CustomerListErrorState extends CustomerListState {
  CustomerListErrorState({required List<CustomerListByRouteModel> customerList})
      : super(customerList: customerList);
}
