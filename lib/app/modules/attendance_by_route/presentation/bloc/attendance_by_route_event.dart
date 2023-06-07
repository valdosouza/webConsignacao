import 'package:appweb/app/modules/attendance_by_route/domain/usecase/customer_get_list.dart';
import 'package:appweb/app/modules/attendance_by_route/domain/usecase/customer_set_turn_back.dart';
import 'package:appweb/app/modules/order_attendence_register/data/model/order_attendance_model.dart';

abstract class AttendanceByRouteEvent {}

class SalesRouteGetListEvent extends AttendanceByRouteEvent {}

class SalesRouteSearchEvent extends AttendanceByRouteEvent {
  String search;

  SalesRouteSearchEvent({
    required this.search,
  });
}

class CustomerGetListEvent extends AttendanceByRouteEvent {
  final ParamsGetListCustomerByRoute params;
  CustomerGetListEvent({
    required this.params,
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
  final int tbCustomerId;
  final int tbSalesRouteId;
  final int sequence;
  CustomerOrderedModeEvent({
    required this.tbCustomerId,
    required this.tbSalesRouteId,
    required this.sequence,
  });
}

class CustomerCancelOrderModeEvent extends AttendanceByRouteEvent {}

class CustomerSetTurnBackEvent extends AttendanceByRouteEvent {
  ParamsSetTurnBack params;
  CustomerSetTurnBackEvent({
    required this.params,
  });
}
