
import 'package:appweb/app/modules/order_attendence_register/data/models/order_attendance_supplying_model.dart';

import '../../domain/entity/order_attendance_checkpoint_entity.dart';

class OrderAttendanceCheckpointModel extends OrderAttendanceCheckpointEntity {
  OrderAttendanceCheckpointOrderModel order;
  List<OrderAttendanceCheckpointItemsModel> items;
  List<OrderAttendanceCheckpointPaymentModel> payments;

  OrderAttendanceCheckpointModel({
    required this.order,
    required this.items,
    required this.payments,
  }) : super(order: order, items: items, payments: payments);

  factory OrderAttendanceCheckpointModel.fromJson(Map<String, dynamic> json) {
    return OrderAttendanceCheckpointModel(
      order: OrderAttendanceCheckpointOrderModel.fromJson(json['order']),
      items: (json['Items'] as List)
          .map((e) => OrderAttendanceCheckpointItemsModel.fromJson(e))
          .toList(),
      payments: (json['Payments'] as List)
          .map((e) => OrderAttendanceCheckpointPaymentModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['Order'] = order.toJson();
    data['Items'] = items.map((v) => v.toJson()).toList();
    data['Payments'] = payments.map((v) => v.toJson()).toList();
    return data;
  }

  factory OrderAttendanceCheckpointModel.isEmpty() {
    return OrderAttendanceCheckpointModel(
      order: OrderAttendanceCheckpointOrderModel(
          id: 0,
          tbInstitutionId: 1,
          tbCustomerId: 51,
          nameCustomer: "Aleatorio",
          totalValue: 0,
          changeValue: 0,
          debitBalance: 0),
      items: [],
      payments: [],
    );
  }

  factory OrderAttendanceCheckpointModel.fromSupplying(
      OrderAttendanceSupplyingModel supplying) {
    return OrderAttendanceCheckpointModel(
      order: OrderAttendanceCheckpointOrderModel(
          id: supplying.order.id,
          tbInstitutionId: supplying.order.tbInstitutionId,
          tbCustomerId: supplying.order.tbCustomerId,
          nameCustomer: supplying.order.nameCustomer,
          totalValue: 0,
          changeValue: 0,
          debitBalance: 0),
      items: supplying.items
          .map((e) => OrderAttendanceCheckpointItemsModel(
              tbProductId: e.tbProductId,
              bonus: e.bonus,
              leftover: e.leftover,
              qtyConsigned: e.qtyConsigned,
              qtySold: 0,
              unitValue: 0))
          .toList(),
      payments: [],
    );
  }
}

class OrderAttendanceCheckpointOrderModel
    extends OrderAttendanceCheckpointOrderEntity {
  int id;
  int tbInstitutionId;
  int tbCustomerId;
  String nameCustomer;
  double totalValue;
  double changeValue;
  double debitBalance;

  OrderAttendanceCheckpointOrderModel({
    required this.id,
    required this.tbInstitutionId,
    required this.tbCustomerId,
    required this.nameCustomer,
    required this.totalValue,
    required this.changeValue,
    required this.debitBalance,
  }) : super(
          id: id,
          tbInstitutionId: tbInstitutionId,
          tbCustomerId: tbCustomerId,
          nameCustomer: nameCustomer,
          totalValue: totalValue,
          changeValue: changeValue,
          debitBalance: debitBalance,
        );

  factory OrderAttendanceCheckpointOrderModel.fromJson(
      Map<String, dynamic> json) {
    return OrderAttendanceCheckpointOrderModel(
      id: int.parse(json['id'].toString()),
      tbInstitutionId: int.parse(json['tb_institution_id'].toString()),
      tbCustomerId: int.parse(json['tb_customer_id'].toString()),
      nameCustomer: json['name_customer'].toString(),
      totalValue: double.parse(json['total_value'].toString()),
      changeValue: double.parse(json['change_value'].toString()),
      debitBalance: double.parse(json['debit_balance'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'tb_institution_id': tbInstitutionId,
      'tb_customer_id': tbCustomerId,
      'name_customer': nameCustomer,
      'total_value': totalValue,
      'change_value': changeValue,
      'debit_balance': debitBalance,
    };
  }
}

class OrderAttendanceCheckpointItemsModel
    extends OrderAttendanceCheckpointItemsEntity {
  int tbProductId;
  int bonus;
  int qtyConsigned;
  int leftover;
  int qtySold;
  double unitValue;
  OrderAttendanceCheckpointItemsModel({
    required this.tbProductId,
    required this.bonus,
    required this.qtyConsigned,
    required this.leftover,
    required this.qtySold,
    required this.unitValue,
  }) : super(
          tbProductId: tbProductId,
          bonus: bonus,
          qtyConsigned: qtyConsigned,
          leftover: leftover,
          qtySold: qtySold,
          unitValue: unitValue,
        );

  factory OrderAttendanceCheckpointItemsModel.fromJson(
      Map<String, dynamic> json) {
    return OrderAttendanceCheckpointItemsModel(
      tbProductId: int.parse(json['tb_product_id'].toString()),
      bonus: int.parse(json['bonus'].toString()),
      qtyConsigned: int.parse(json['qty_consigned'].toString()),
      leftover: int.parse(json['leftover'].toString()),
      qtySold: int.parse(json['qty_sold'].toString()),
      unitValue: double.parse(json['unit_value'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tb_product_id': tbProductId,
      'bonus': bonus,
      'qty_consigned': qtyConsigned,
      'leftover': leftover,
      'qty_sold': qtySold,
      'unit_value': unitValue,
    };
  }
}

class OrderAttendanceCheckpointPaymentModel
    extends OrderAttendanceCheckpointPaymentEntity {
  int tbPaymentTypeId;
  String namePaymentType;
  double value;

  OrderAttendanceCheckpointPaymentModel({
    required this.tbPaymentTypeId,
    required this.namePaymentType,
    required this.value,
  }) : super(
          tbPaymentTypeId: tbPaymentTypeId,
          namePaymentType: namePaymentType,
          value: value,
        );

  factory OrderAttendanceCheckpointPaymentModel.fromJson(
      Map<String, dynamic> json) {
    return OrderAttendanceCheckpointPaymentModel(
      tbPaymentTypeId: int.parse(json['tb_payment_type_id'].toString()),
      namePaymentType: json['name_payment_type'].toString(),
      value: double.parse(json['value'].toString()),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'tb_payment_type_id': tbPaymentTypeId,
      'name_payment_type': namePaymentType,
      'value': value,
    };
  }
}
