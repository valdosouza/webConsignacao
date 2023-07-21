abstract class AttendanceByRouteState {}

/*----------------------------------------------------------------------------*/
abstract class SalesRouteListState extends AttendanceByRouteState {}

class SalesRouteListLoadingState extends SalesRouteListState {}

class SalesRouteListLoadedState extends SalesRouteListState {}

class SalesRouteListErrorState extends SalesRouteListState {
  final String error;
  SalesRouteListErrorState({required this.error});
}

/*----------------------------------------------------------------------------*/
class CustomerListState extends AttendanceByRouteState {}

class CustomerListLoadingState extends CustomerListState {}

class CustomerListLoadedState extends CustomerListState {}

class CustomerListErrorState extends CustomerListState {
  final String error;
  CustomerListErrorState({required this.error});
}

class CustomerListOrderState extends CustomerListState {}

class CustomerListOrderErrorState extends CustomerListState {}
