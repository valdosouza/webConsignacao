import 'package:appweb/app/modules/product/domain/entity/produtcs_price_list_product_entity.dart';
import 'package:dartz/dartz.dart';

class ProductsPriceListProductsModel extends ProductsPriceListProductsEntity {
  ProductsPriceListProductsModel({
    required super.tbPriceListId,
    required super.namePriceList,
    required super.products,
  });

  factory ProductsPriceListProductsModel.fromJson(Map<String?, dynamic> json) {
    return ProductsPriceListProductsModel(
        tbPriceListId: json['tb_price_list_id'],
        namePriceList: json['name_price_list'],
        products: (json['product_price'] as List).map((e) {
          return Tuple3<int, String, double>(
              e['id'], e['name_product'], e['price_tag']);
        }).toList());
  }
}
