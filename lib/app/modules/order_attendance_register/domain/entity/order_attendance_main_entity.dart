import 'package:appweb/app/modules/order_attendance_register/data/model/order_attendance_register_items_model.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/entity/order_attendance_entity.dart';

class OrderAttendanceRegisterMainEntity{
  OrderAttendanceRegisterEntity orderAttendanceRegister;
  List<OrderAttendanceRegisterItemsModel> items;

  OrderAttendanceRegisterMainEntity({
    required this.orderAttendanceRegister,
    required this.items,
  });

}