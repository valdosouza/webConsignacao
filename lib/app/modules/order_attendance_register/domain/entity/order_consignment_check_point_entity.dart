import 'package:appweb/app/modules/order_attendance_register/domain/entity/order_consignment_check_point_items_entity.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/entity/order_consignment_check_point_payment_entity.dart';

class OrderConsignmentCheckPointEntity{
  int tbInstitutionId;
  int tbOrderId;
  List<OrderConsignmentCheckPointItemsEntity> items;
  double totalValue;
  List<OrderConsignmentCheckPointPaymentEntity> payments;
  double changeValue;
  double debitBalance;

  OrderConsignmentCheckPointEntity({
    this.tbInstitutionId = 0,
    this.tbOrderId = 0,
    this.items = const [],
    this.totalValue = 0.0,
    this.payments = const [],
    this.changeValue = 0.0,
    this.debitBalance = 0.0,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tb_institution_id'] = tbInstitutionId;
    data['tb_order_id'] = tbOrderId;
    data['items'] = items.map((v) => v.toJson()).toList();
    data['total_value'] = totalValue;
    data['payments'] = payments.map((v) => v.toJson()).toList();
    data['change_value'] = changeValue;
    data['debit_balance'] = debitBalance;
    return data;
  }

  factory OrderConsignmentCheckPointEntity.fromJson(Map<String, dynamic> json) {
    return OrderConsignmentCheckPointEntity(
      tbInstitutionId: json['tb_institution_id'],
      tbOrderId: json['tb_order_id'],
      items: (json['items'] as List<dynamic>).map((e) => OrderConsignmentCheckPointItemsEntity.fromJson(e as Map<String, dynamic>)).toList(),
      totalValue: json['total_value'],
      payments: (json['payments'] as List<dynamic>).map((e) => OrderConsignmentCheckPointPaymentEntity.fromJson(e as Map<String, dynamic>)).toList(),
      changeValue: json['change_value'],
      debitBalance: json['debit_balance'],
    );
  }
}