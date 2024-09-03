import 'package:appweb/app/modules/cashier_statement_summary/domain/entity/product_bonus_entity.dart';

class ProductBonusModel extends ProductBonusEntity {
  ProductBonusModel({
    int? id,
    String? description,
    int? quantity,
  }) : super(
          id: id ?? 0,
          description: description ?? "",
          quantity: quantity ?? 0,
        );

  factory ProductBonusModel.fromJson(Map<String, dynamic> json) {
    return ProductBonusModel(
      id: json['id'],
      description: json['description'],
      quantity: json['quantity'],
    );
  }

  factory ProductBonusModel.empty() {
    return ProductBonusModel(
      id: 0,
      description: "",
      quantity: 0,
    );
  }
}
