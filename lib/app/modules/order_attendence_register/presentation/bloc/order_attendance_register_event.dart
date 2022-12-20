import 'package:appweb/app/modules/order_attendence_register/data/models/order_attendance_model.dart';

class OrderAttendanceRegisterEvent {}

class OrderAttendanceGetPriceListEvent extends OrderAttendanceRegisterEvent {}

class OrderAttendanceRegisterPostEvent extends OrderAttendanceRegisterEvent {
  final OrderAttendanceModel orderAttendance;

  OrderAttendanceRegisterPostEvent(this.orderAttendance);
}
