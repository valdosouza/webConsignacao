import 'package:appweb/app/modules/product_register/domain/entity/product_price_list_entity.dart';

class ProductPriceListModel extends ProductPriceListEntity {
  ProductPriceListModel({
    int? tbPriceListId,
    double? priceTag,
    String? namePriceList,
  }) : super(
          tbPriceListId: tbPriceListId ?? 0,
          priceTag: priceTag ?? 0.0,
          namePriceList: namePriceList ?? "",
        );

  factory ProductPriceListModel.fromJson(Map<String?, dynamic> json) {
    return ProductPriceListModel(
      tbPriceListId: json['tb_price_list_id'] is String
          ? int.parse(json['tb_price_list_id'])
          : json['tb_price_list_id'],
      priceTag: json['price_tag'] is String
          ? double.parse(json['price_tag'])
          : json['price_tag'],
      namePriceList: json['name_price_list'] as String? ?? "",
    );
  }
}
