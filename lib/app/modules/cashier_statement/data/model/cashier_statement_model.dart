import 'package:appweb/app/modules/cashier_statement/domain/entity/cashier_statement_entity.dart';

class CashierStatementModel extends CashierStatementEntity {
  CashierStatementModel({
    required String description,
    required double tagValue,
    required String kind,
    required String color,
  }) : super(
          description: description,
          tagValue: tagValue,
          kind: kind,
          color: color,
        );

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
