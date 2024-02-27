import 'package:appweb/app/modules/stock_balance/domain/entity/stock_balance_by_product_entity.dart';

class StockBalanceByProductModel extends StockBalanceByProductEntity {
  StockBalanceByProductModel({
    int? tbMerchandiseId,
    String? nameProduct,
    List<StockBalanceCustomerModel>? items,
  }) : super(
          tbMerchandiseId: tbMerchandiseId ?? 0,
          nameProduct: nameProduct ?? "",
          items: items ?? [],
        );

  factory StockBalanceByProductModel.fromJson(Map<String, dynamic> json) {
    return StockBalanceByProductModel(
      tbMerchandiseId: json['tb_merchandise_id'] as int? ?? 0,
      nameProduct: json['name_product'],
      items: json['items'] == null
          ? null
          : (json['items'] as List)
              .map((e) => StockBalanceCustomerModel.fromJson(e))
              .toList(),
    );
  }

  factory StockBalanceByProductModel.empty() {
    return StockBalanceByProductModel(
      tbMerchandiseId: 0,
      nameProduct: "",
      items: [],
    );
  }
}

class StockBalanceCustomerModel extends StockBalanceCustomerEntity {
  StockBalanceCustomerModel({
    String? nameCustomer,
    int? quantity,
  }) : super(nameCustomer: nameCustomer ?? "", quantity: quantity ?? 0);

  factory StockBalanceCustomerModel.fromJson(Map<String, dynamic> json) {
    return StockBalanceCustomerModel(
      nameCustomer: json['name_customer'],
      quantity: json['quantity'] is String
          ? double.parse(json['quantity'])
          : json['quantity'],
    );
  }
}
