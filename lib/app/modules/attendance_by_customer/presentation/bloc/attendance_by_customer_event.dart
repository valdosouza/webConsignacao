abstract class AttendanceByCustomerEvent {}

class CustomerGetListEvent extends AttendanceByCustomerEvent {
  final int? tbSalesmanId;
  CustomerGetListEvent({
    this.tbSalesmanId,
  });
}

class CustomerEditListEvent extends AttendanceByCustomerEvent {
  final int? tbCustomerId;
  CustomerEditListEvent({
    this.tbCustomerId,
  });
}

class CustomerSearchEvent extends AttendanceByCustomerEvent {
  String search;

  CustomerSearchEvent({
    required this.search,
  });
}
