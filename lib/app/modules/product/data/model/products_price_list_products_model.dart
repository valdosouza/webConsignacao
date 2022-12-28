import 'package:appweb/app/modules/product/domain/entity/produtcs_price_list_product_entity.dart';
import 'package:dartz/dartz.dart';

class ProductsPriceListProductsModel extends ProductsPriceListProductsEntity{
  ProductsPriceListProductsModel({required super.namePriceList, required super.products});

  factory ProductsPriceListProductsModel.fromJson(Map<String?, dynamic> json) {
    return ProductsPriceListProductsModel(
      namePriceList: json['name_price_list'],
      products: (json['Produtos'] as List).map((e) {
        return Tuple2<String, double>(e['name_product'], e['unit_value']);
      }).toList()          
    );
  }

}