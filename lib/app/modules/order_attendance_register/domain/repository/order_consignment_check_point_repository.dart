import 'package:appweb/app/modules/order_attendance_register/domain/entity/order_consignment_check_point_entity.dart';

abstract class OrderConsignmentCheckPointRepository {
  Future<List<OrderConsignmentCheckPointEntity>> getAttendances();
  Future<OrderConsignmentCheckPointEntity> getAttendance(int id);
  Future<OrderConsignmentCheckPointEntity> createAttendance(OrderConsignmentCheckPointEntity consignmentCheckPoint);
  Future<OrderConsignmentCheckPointEntity> updateAttendance(OrderConsignmentCheckPointEntity consignmentCheckPoint);
  Future<void> deleteAttendance(int id);
}