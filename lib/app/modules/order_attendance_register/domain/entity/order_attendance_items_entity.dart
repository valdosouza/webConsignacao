import 'package:appweb/app/modules/order_attendance_register/data/model/order_attendance_register_items_model.dart';

class OrderAttendanceRegisterItems{
  String tbProductId;
  String nameProduct;
  int bonus;
  int leftover;
  int devoluttion;
  int newConsignment;
  int qttyConsigned;

  OrderAttendanceRegisterItems({
    this.tbProductId = "",
    this.nameProduct = "",
    this.bonus = 0,
    this.leftover = 0,
    this.devoluttion = 0,
    this.newConsignment = 0,
    this.qttyConsigned = 0,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tb_product_id'] = tbProductId;
    data['name_product'] = nameProduct;
    data['bonus'] = bonus;
    data['leftover'] = leftover;
    data['devoluttion'] = devoluttion;
    data['new_consignment'] = newConsignment;
    data['qtty_consigned'] = qttyConsigned;
    return data;
  }

  OrderAttendanceRegisterItemsModel toModel(OrderAttendanceRegisterItems entity) {
    return OrderAttendanceRegisterItemsModel(
      tbProductId: entity.tbProductId,
      nameProduct: entity.nameProduct,
      bonus: entity.bonus,
      leftover: entity.leftover,
      devoluttion: entity.devoluttion,
      newConsignment: entity.newConsignment,
      qttyConsigned: entity.qttyConsigned,
    );
  }

}