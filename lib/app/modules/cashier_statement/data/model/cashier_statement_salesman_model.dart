import 'package:appweb/app/modules/cashier_statement/domain/entity/cashier_statement_salesman_entity.dart';

class CashierStatementSalesmanModel extends CashierStatementSalesmanEntity {
  CashierStatementSalesmanModel({
    int? id,
    String? nameSalesman,
    double? valuerCharged,
  }) : super(
          id: id ?? 0,
          nameSalesman: nameSalesman ?? "",
          valuerCharged: valuerCharged ?? 0.00,
        );

  factory CashierStatementSalesmanModel.fromJson(Map<String, dynamic> json) {
    return CashierStatementSalesmanModel(
      id: json['id'],
      nameSalesman: json['name_salesman'],
      valuerCharged: json['value_charged'] is String
          ? double.parse(json['value_charged'])
          : json['value_charged'],
    );
  }

  factory CashierStatementSalesmanModel.empty() {
    return CashierStatementSalesmanModel();
  }
}
