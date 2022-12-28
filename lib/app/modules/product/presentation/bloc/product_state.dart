import 'package:appweb/app/modules/product/domain/entity/produtcs_price_list_product_entity.dart';

abstract class ProductState {
  List<ProductsPriceListProductsEntity> list;

  ProductState({
    required this.list,
  });
}

class ProductLoadingState extends ProductState {
  ProductLoadingState()
      : super(list: []);
}

class ProductPriceListMobileSuccessState extends ProductState {
  ProductPriceListMobileSuccessState(
      {required List<ProductsPriceListProductsEntity> list})
      : super(list: list);
}

class ProductPriceListMobileErrorState extends ProductState {
  ProductPriceListMobileErrorState(
      {required List<ProductsPriceListProductsEntity> list})
      : super(list: list);
}
