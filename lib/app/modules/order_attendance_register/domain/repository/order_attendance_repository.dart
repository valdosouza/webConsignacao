import 'package:appweb/app/modules/order_attendance_register/domain/entity/order_attendance_entity.dart';

abstract class OrderAttendanceRepository {
  Future<List<OrderAttendanceEntity>> getAttendances();
  Future<OrderAttendanceEntity> getAttendance(int id);
  Future<OrderAttendanceEntity> createAttendance(OrderAttendanceEntity attendance);
  Future<OrderAttendanceEntity> updateAttendance(OrderAttendanceEntity attendance);
  Future<void> deleteAttendance(int id);
}