abstract class AttendanceByCustomerEvent {}

class CustomerGetListEvent extends AttendanceByCustomerEvent {
  final int? tbSalesmanId;
  CustomerGetListEvent({
    this.tbSalesmanId,
  });
}

class CustomerSearchEvent extends AttendanceByCustomerEvent {
  String search;

  CustomerSearchEvent({
    required this.search,
  });
}
