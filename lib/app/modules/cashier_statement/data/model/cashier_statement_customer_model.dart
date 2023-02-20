import 'package:appweb/app/modules/cashier_statement/domain/entity/cashier_statement_customer_entity.dart';

class CashierStatementCustomerModel extends CashierStatementCustomerEntity {
  CashierStatementCustomerModel({
    int? tbOrderId,
    int? id,
    String? nameCustomer,
    String? timeAttendace,
    double? valuerCharged,
    String? note,
    bool? expanded,
  }) : super(
            tbOrderId: tbOrderId ?? 0,
            id: id ?? 0,
            nameCustomer: nameCustomer ?? "",
            timeAttendace: timeAttendace ?? "",
            valuerCharged: valuerCharged ?? 0.00,
            note: note ?? "",
            expanded: false);

  factory CashierStatementCustomerModel.fromJson(Map<String, dynamic> json) {
    return CashierStatementCustomerModel(
      tbOrderId: json['tb_order_id'],
      id: json['id'],
      nameCustomer: json['name_customer'],
      timeAttendace: json['time_attendace'],
      valuerCharged: json['value_charged'] is String
          ? double.parse(json['value_charged'])
          : json['value_charged'],
      note: json['note'],
      expanded: false,
    );
  }

  factory CashierStatementCustomerModel.empty() {
    return CashierStatementCustomerModel();
  }
}
