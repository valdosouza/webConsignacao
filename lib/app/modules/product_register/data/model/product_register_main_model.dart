import 'package:appweb/app/modules/product_register/data/model/product_price_list_model.dart';
import 'package:appweb/app/modules/product_register/data/model/product_register_model.dart';
import 'package:appweb/app/modules/product_register/domain/entity/produc_register_main_entity.dart';

class ProductRegisterMainModel extends ProductRegisterMainEntity {
  ProductRegisterMainModel({
    required ProductRegisterModel product,
    required List<ProductPriceListModel> priceList,
  }) : super(
          product: product,
          priceList: priceList,
        );

  factory ProductRegisterMainModel.fromJson(Map<String?, dynamic> json) {
    return ProductRegisterMainModel(
      product: ProductRegisterModel.fromJson(json['product']),
      priceList: (json['pricelist'] as List)
          .map((e) => ProductPriceListModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product'] = product.toJson();
    data['pricelist'] = priceList.map((e) => e.toJson()).toList();
    return data;
  }
}
