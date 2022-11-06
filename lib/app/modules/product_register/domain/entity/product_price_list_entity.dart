class ProductPriceListEntity {
  int tbPriceListId;
  int priceTag;
  String namePriceList;

  ProductPriceListEntity({
    this.tbPriceListId = 0,
    this.priceTag = 0,
    this.namePriceList = "",
  });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = tbPriceListId;
    data['price_tag'] = priceTag;
    data['name_price_list'] = namePriceList;
    return data;
  }
}
