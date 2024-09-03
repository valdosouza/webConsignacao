import 'package:appweb/app/modules/cashier_statement_summary/domain/entity/product_load_entity.dart';

class ProductLoadModel extends ProductLoadEntity {
  ProductLoadModel({
    int? id,
    String? description,
    int? totalSale,
    int? totalBonus,
    int? totalAdjust,
    int? totalNewLoad,
  }) : super(
          id: id ?? 0,
          description: description ?? "",
          totalSale: totalSale ?? 0,
          totalBonus: totalBonus ?? 0,
          totalAdjust: totalAdjust ?? 0,
          totalNewLoad: totalNewLoad ?? 0,
        );

  factory ProductLoadModel.fromJson(Map<String, dynamic> json) {
    return ProductLoadModel(
      id: json['id'],
      description: json['description'],
      totalSale: json['total_sale'],
      totalBonus: json['total_bonus'],
      totalAdjust: json['total_adjust'],
      totalNewLoad: json['total_new_load'],
    );
  }

  factory ProductLoadModel.empty() {
    return ProductLoadModel(
      id: 0,
      description: "",
      totalSale: 0,
      totalBonus: 0,
      totalAdjust: 0,
      totalNewLoad: 0,
    );
  }
}
