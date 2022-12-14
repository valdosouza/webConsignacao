import 'package:appweb/app/modules/order_attendance_register/data/model/order_consignment_check_point_items_model.dart';
import 'package:appweb/app/modules/order_attendance_register/data/model/order_consignment_check_point_payment_model.dart';
import 'package:appweb/app/modules/order_attendance_register/domain/entity/order_consignment_check_point_entity.dart';

class OrderConsignmentCheckPointModel extends OrderConsignmentCheckPointEntity {
  OrderConsignmentCheckPointModel({
    required int tbInstitutionId,
    required int tbOrderId,
    required List<OrderConsignmentCheckPointItemsModel> items,
    required double totalValue,
    required List<OrderConsignmentCheckPointPaymentModel> payments,
    required double changeValue,
    required double debitBalance,
  }) : super(
          tbInstitutionId: tbInstitutionId,
          tbOrderId: tbOrderId,
          items: items,
          totalValue: totalValue,
          payments: payments,
          changeValue: changeValue,
          debitBalance: debitBalance,
        );

  factory OrderConsignmentCheckPointModel.fromJson(Map<String, dynamic> json) {
    return OrderConsignmentCheckPointModel(
      tbInstitutionId: json['tb_institution_id'],
      tbOrderId: json['tb_order_id'],
      items: (json['items'] as List)
          .map((e) => OrderConsignmentCheckPointItemsModel.fromJson(e))
          .toList(),
      totalValue: json['total_value'],
      payments: (json['payments'] as List)
          .map((e) => OrderConsignmentCheckPointPaymentModel.fromJson(e))
          .toList(),
      changeValue: json['change_value'],
      debitBalance: json['debit_balance'],
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['tb_institution_id'] = tbInstitutionId;
    data['tb_order_id'] = tbOrderId;
    data['items'] = items.map((e) => e.toJson()).toList();
    data['total_value'] = totalValue;
    data['payments'] = payments.map((e) => e.toJson()).toList();
    data['change_value'] = changeValue;
    data['debit_balance'] = debitBalance;
    return data;
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is OrderConsignmentCheckPointModel &&
        other.tbInstitutionId == tbInstitutionId &&
        other.tbOrderId == tbOrderId &&
        other.items == items &&
        other.totalValue == totalValue &&
        other.payments == payments &&
        other.changeValue == changeValue &&
        other.debitBalance == debitBalance;
  }

  @override
  int get hashCode {
    return tbInstitutionId.hashCode ^
        tbOrderId.hashCode ^
        items.hashCode ^
        totalValue.hashCode ^
        payments.hashCode ^
        changeValue.hashCode ^
        debitBalance.hashCode;
  }
}
