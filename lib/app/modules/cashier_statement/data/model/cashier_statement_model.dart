import 'package:appweb/app/modules/cashier_statement/domain/entity/cashier_statement_entity.dart';

class CashierStatementModel extends CashierStatementEntity {
  CashierStatementModel({
    required super.description,
    required super.tagValue,
    required super.kind,
    required super.color,
  });

  factory CashierStatementModel.fromJson(Map<String, dynamic> json) {
    return CashierStatementModel(
      description: json['description'],
      tagValue: json['tag_value'] is int
          ? json['tag_value'].toDouble()
          : json['tag_value'],
      kind: json['kind'],
      color: json['color'],
    );
  }

  factory CashierStatementModel.empty() {
    return CashierStatementModel(
      description: "",
      tagValue: 0,
      kind: "info",
      color: "black",
    );
  }
}
