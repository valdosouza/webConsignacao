import 'package:appweb/app/modules/product_register/data/model/product_price_list_model.dart';

class ProductPriceListEntity {
  int? tbPriceListId;
  double? priceTag;
  String? namePriceList;

  ProductPriceListEntity({
    this.tbPriceListId,
    this.priceTag,
    this.namePriceList,
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = tbPriceListId;
    data['price_tag'] = priceTag;
    data['name_price_list'] = namePriceList;
    return data;
  }

  ProductPriceListModel toModel(ProductPriceListEntity entity) {
    return ProductPriceListModel(
      tbPriceListId: entity.tbPriceListId,
      namePriceList: entity.namePriceList,
      priceTag: entity.priceTag,
    );
  }
}
