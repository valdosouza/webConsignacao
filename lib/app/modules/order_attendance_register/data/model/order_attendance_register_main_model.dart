import 'package:appweb/app/modules/order_attendance_register/data/model/order_attendance_register_items_model.dart';
import 'package:appweb/app/modules/order_attendance_register/data/model/order_attendance_register_model.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/entity/order_attendance_main_entity.dart';

class OrderAttendanceRegisterMainModel extends OrderAttendanceRegisterMainEntity {
  OrderAttendanceRegisterMainModel({
    required OrderAttendanceRegisterModel orderAttendanceRegister,
    required List<OrderAttendanceRegisterItemsModel> items,
  }) : super(orderAttendanceRegister: orderAttendanceRegister, items: items);

  factory OrderAttendanceRegisterMainModel.fromJson(Map<String, dynamic> json) {
    return OrderAttendanceRegisterMainModel(
      orderAttendanceRegister: OrderAttendanceRegisterModel.fromJson(json['order']),
      items: List<OrderAttendanceRegisterItemsModel>.from(
          json['items'].map((x) => OrderAttendanceRegisterItemsModel.fromJson(x))),
    );
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    data['orderAttendanceRegister'] = orderAttendanceRegister.toJson();
    data['items'] = items.map((x) => x.toJson()).toList();
    return data;
  }

  factory OrderAttendanceRegisterMainModel.empty() {
    return OrderAttendanceRegisterMainModel(
      orderAttendanceRegister: OrderAttendanceRegisterModel.empty(),
      items: <OrderAttendanceRegisterItemsModel>[],
    );
  }
}
