import 'package:appweb/app/modules/cashier_statement/domain/entity/cashier_statement_entity.dart';

class CashierStatementModel extends CashierStatementEntity {
  CashierStatementModel({
    String? description,
    double? tagValue,
    String? kind,
  }) : super(
            description: description ?? "",
            tagValue: tagValue ?? 0.00,
            kind: kind ?? "");

  factory CashierStatementModel.fromJson(Map<String, dynamic> json) {
    return CashierStatementModel(
      description: json['description'],
      tagValue: json['tag_value'] is String ? double.parse(json['tag_value']) : json['tag_value'],
      kind: json['kind'],
    );
  }

  factory CashierStatementModel.empty() {
    return CashierStatementModel();
  }
}
