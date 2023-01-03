import 'package:appweb/app/modules/product/domain/entity/produtcs_price_list_product_entity.dart';

class ProductsPriceListModel extends ProductsPriceListEntity {
  ProductsPriceListModel({
    required super.tbPriceListId,
    required super.namePriceList,
    required super.productPrice,
  });

  factory ProductsPriceListModel.fromJson(Map<String?, dynamic> json) {
    return ProductsPriceListModel(
      tbPriceListId: json['tb_price_list_id'],
      namePriceList: json['name_price_list'],
      productPrice: (json['product_price'] as List)
          .map((e) => ProductsPriceListItemsModel.fromJson(e))
          .toList(),
    );
  }
}

class ProductsPriceListItemsModel extends ProductsPriceListItemsEntity {
  ProductsPriceListItemsModel({
    required super.id,
    required super.nameProduct,
    required super.priceTag,
  });

  factory ProductsPriceListItemsModel.fromJson(Map<String?, dynamic> json) {
    return ProductsPriceListItemsModel(
      id: json['id'],
      nameProduct: json['name_product'],
      priceTag: json['price_tag'],
    );
  }
}
