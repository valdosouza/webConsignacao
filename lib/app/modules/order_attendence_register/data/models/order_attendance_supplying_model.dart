
import 'package:appweb/app/modules/order_attendence_register/domain/entity/order_attendance_supplying_entity.dart';

class OrderAttendanceSupplyingModel extends OrderAttendanceSupplyingEntity {
  OrderAttendanceSupplyingOrderModel order;
  List<OrderAttendanceSupplyingItemsModel> items;

  OrderAttendanceSupplyingModel({
    required this.order,
    required this.items,
  }) : super(
          order: order,
          items: items,
        );

  factory OrderAttendanceSupplyingModel.fromJson(Map<String, dynamic> json) {
    return OrderAttendanceSupplyingModel(
      order: OrderAttendanceSupplyingOrderModel.fromJson(json['Order']),
      items: (json['Items'] as List)
          .map((e) => OrderAttendanceSupplyingItemsModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Order': order.toJson(),
      'Items': items.map((e) => e.toJson()).toList(),
    };
  }

  factory OrderAttendanceSupplyingModel.isEmpty() {
    return OrderAttendanceSupplyingModel(
      order: OrderAttendanceSupplyingOrderModel(id: 1, tbInstitutionId: 1, tbCustomerId: 51, nameCustomer: "Aleatorio"),
      items: [],
    );
  }

}

class OrderAttendanceSupplyingOrderModel
    extends OrderAttendanceSupplyingOrderEntity {
  int id;
  int tbInstitutionId;
  int tbCustomerId;
  String nameCustomer;

  OrderAttendanceSupplyingOrderModel({
    required this.id,
    required this.tbInstitutionId,
    required this.tbCustomerId,
    required this.nameCustomer,
  }) : super(
          id: id,
          tbInstitutionId: tbInstitutionId,
          tbCustomerId: tbCustomerId,
          nameCustomer: nameCustomer,
        );

  factory OrderAttendanceSupplyingOrderModel.fromJson(
      Map<String, dynamic> json) {
    return OrderAttendanceSupplyingOrderModel(
      id: int.parse(json['id'].toString()),
      tbInstitutionId: int.parse(json['tb_institution_id'].toString()),
      tbCustomerId: int.parse(json['tb_customer_id'].toString()),
      nameCustomer: json['name_customer'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tb_institution_id': tbInstitutionId,
      'tb_customer_id': tbCustomerId,
      'name_customer': nameCustomer,
    };
  }

}

class OrderAttendanceSupplyingItemsModel
    extends OrderAttendanceSupplyingItemsEntity {
  int tbProductId;
  int nameProduct;
  int bonus;
  int leftover;
  int devolution;
  int newConsignment;
  int qtyConsigned;

  OrderAttendanceSupplyingItemsModel({
    required this.tbProductId,
    required this.nameProduct,
    required this.bonus,
    required this.leftover,
    required this.devolution,
    required this.newConsignment,
    required this.qtyConsigned,
  }) : super(
          tbProductId: tbProductId,
          nameProduct: nameProduct,
          bonus: bonus,
          leftover: leftover,
          devolution: devolution,
          newConsignment: newConsignment,
          qtyConsigned: qtyConsigned,
        );

  factory OrderAttendanceSupplyingItemsModel.fromJson(
      Map<String, dynamic> json) {
    return OrderAttendanceSupplyingItemsModel(
      tbProductId: int.parse(json['tb_product_id'].toString()),
      nameProduct: int.parse(json['name_product']),
      bonus: int.parse(json['bonus'].toString()),
      leftover: int.parse(json['leftover'].toString()),
      devolution: int.parse(json['devolution'].toString()),
      newConsignment: int.parse(json['new_consignment'].toString()),
      qtyConsigned: int.parse(json['qty_consigned'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tb_product_id': tbProductId,
      'name_product': nameProduct,
      'bonus': bonus,
      'leftover': leftover,
      'devolution': devolution,
      'new_consignment': newConsignment,
      'qty_consigned': qtyConsigned,
    };
  }

}
