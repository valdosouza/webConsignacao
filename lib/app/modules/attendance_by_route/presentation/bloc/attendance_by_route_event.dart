abstract class AttendanceByRouteEvent {}

class SalesRouteGetListEvent extends AttendanceByRouteEvent {}

class SalesRouteSearchEvent extends AttendanceByRouteEvent {
  String search;

  SalesRouteSearchEvent({
    required this.search,
  });
}

class CustomerGetListEvent extends AttendanceByRouteEvent {
  final int? tbSalesRouteId;
  CustomerGetListEvent({
    this.tbSalesRouteId,
  });
}

class CustomerSearchEvent extends AttendanceByRouteEvent {
  String search;

  CustomerSearchEvent({
    required this.search,
  });
}
