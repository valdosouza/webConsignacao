import 'package:appweb/app/modules/product/data/model/products_price_list_products_model.dart';

class ProductsPriceListEntity {
  final int tbPriceListId;
  final String namePriceList;
  final List<ProductsPriceListItemsModel> productPrice;

  ProductsPriceListEntity({
    required this.tbPriceListId,
    required this.namePriceList,
    required this.productPrice,
  });
}

class ProductsPriceListItemsEntity {
  final int id;
  final String nameProduct;
  final double priceTag;

  ProductsPriceListItemsEntity({
    required this.id,
    required this.nameProduct,
    required this.priceTag,
  });
}
