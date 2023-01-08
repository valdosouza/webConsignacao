import 'package:appweb/app/modules/cashier_statement/domain/entity/cashier_statement_customer_entity.dart';

class CashierStatementCustomerModel extends CashierStatementCustomerEntity {
  CashierStatementCustomerModel(
      {int? id,
      String? nameCustomer,
      String? timeAttendace,
      double? valuerCharged})
      : super(
            id: id ?? 0,
            nameCustomer: nameCustomer ?? "",
            timeAttendace: timeAttendace ?? "",
            valuerCharged: valuerCharged ?? 0.00);

  factory CashierStatementCustomerModel.fromJson(Map<String, dynamic> json) {
    return CashierStatementCustomerModel(
      id: json['id'],
      nameCustomer: json['name_customer'],
      timeAttendace: json['time_attendace'],
      valuerCharged: json['value_charged'],
    );
  }

  factory CashierStatementCustomerModel.empty() {
    return CashierStatementCustomerModel();
  }
}
