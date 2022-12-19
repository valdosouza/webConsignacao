abstract class AttendanceBySalesmanEvent {}

class CustomerGetListEvent extends AttendanceBySalesmanEvent {
  final int? tbSalesmanId;
  CustomerGetListEvent({
    this.tbSalesmanId,
  });
}

class CustomerSearchEvent extends AttendanceBySalesmanEvent {
  String search;

  CustomerSearchEvent({
    required this.search,
  });
}
