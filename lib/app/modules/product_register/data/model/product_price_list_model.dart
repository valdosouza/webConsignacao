import 'package:appweb/app/modules/product_register/domain/entity/product_price_list_entity.dart';

class ProductPriceListModel extends ProductPriceListEntity {
  ProductPriceListModel({
    int? tbPriceListId,
    dynamic priceTag,
    String? namePriceList,
  }) : super(
          tbPriceListId: tbPriceListId ?? 0,
          priceTag: priceTag ?? 0.0,
          namePriceList: namePriceList ?? "",
        );

  factory ProductPriceListModel.fromJson(Map<String?, dynamic> json) {
    return ProductPriceListModel(
      tbPriceListId: json['tb_price_list_id'] as int? ?? 0,
      priceTag: json['price_tag'],
      namePriceList: json['name_price_list'] as String? ?? "",
    );
  }
}
