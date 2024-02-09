import 'package:appweb/app/modules/cashier_statement_summary/domain/entity/product_sold_entity.dart';

class ProductSoldModel extends ProductSoldEntity {
  ProductSoldModel({
    int? id,
    String? description,
    double? value,
  }) : super(
          id: id ?? 0,
          description: description ?? "",
          value: value ?? 0.0,
        );

  factory ProductSoldModel.fromJson(Map<String, dynamic> json) {
    return ProductSoldModel(
      id: json['id'],
      description: json['description'],
      value: json['value'] is int ? json['value'].toDouble() : json['value'],
    );
  }

  factory ProductSoldModel.empty() {
    return ProductSoldModel(
      id: 0,
      description: "",
      value: 0.0,
    );
  }
}
