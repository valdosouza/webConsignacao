import 'package:appweb/app/modules/order_attendence_register/data/models/order_attendance_model.dart';

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

class GotoOrderAttendanceRegisterEvent extends AttendanceByRouteEvent {
  final OrderAttendanceModel? orderAttendance;
  GotoOrderAttendanceRegisterEvent({
    required this.orderAttendance,
  });
}

class CustomerOrderModeEvent extends AttendanceByRouteEvent {
  final int tbCustomerId;
  CustomerOrderModeEvent({
    required this.tbCustomerId,
  });
}

class CustomerOrderedModeEvent extends AttendanceByRouteEvent {
  final int tbInstitutionId;
  final int tbCustomerId;
  final int tbSalesRouteId;
  final int sequence;
  CustomerOrderedModeEvent({
    required this.tbInstitutionId,
    required this.tbCustomerId,
    required this.tbSalesRouteId,
    required this.sequence,
  });
}

class CustomerCancelOrderModeEvent extends AttendanceByRouteEvent {}
