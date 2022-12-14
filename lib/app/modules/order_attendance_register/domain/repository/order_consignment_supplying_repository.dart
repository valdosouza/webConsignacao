import 'package:appweb/app/modules/order_attendance_register/domain/entity/order_consignment_supplying_entity.dart';

abstract class OrderConsignmentSupplyingRepository {
  Future<List<OrderConsignmentSupplyingEntity>> getAttendances();
  Future<OrderConsignmentSupplyingEntity> getAttendance(int id);
  Future<OrderConsignmentSupplyingEntity> createAttendance(OrderConsignmentSupplyingEntity consignmentSupplying);
  Future<OrderConsignmentSupplyingEntity> updateAttendance(OrderConsignmentSupplyingEntity consignmentSupplying);
  Future<void> deleteAttendance(int id);
}