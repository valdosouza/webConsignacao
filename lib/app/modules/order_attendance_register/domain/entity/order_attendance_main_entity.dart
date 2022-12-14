import 'package:appweb/app/modules/order_attendance_register/domain/entity/orde_consignment_supplying_entity.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/entity/order_attendance_entity.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/entity/order_consignment_check_point_entity.dart';

class OrderAttendanceMainEntity{
  OrderAttendanceEntity orderAttendance;
  OrderConsignmentCheckPointEntity orderConsignmentCheckPoint;
  OrderConsignmentSupplyingEntity orderConsignmentSupplying;

  OrderAttendanceMainEntity({
    required this.orderAttendance,
    required this.orderConsignmentCheckPoint,
    required this.orderConsignmentSupplying,
  });
}