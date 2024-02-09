import 'package:appweb/app/modules/product/domain/entity/produtcs_price_list_product_entity.dart';

abstract class ProductState {
  List<ProductsPriceListEntity> list;

  ProductState({
    required this.list,
  });
}

class ProductLoadingState extends ProductState {
  ProductLoadingState() : super(list: []);
}

class ProductPriceListMobileSuccessState extends ProductState {
  ProductPriceListMobileSuccessState({required super.list});
}

class ProductPriceListMobileErrorState extends ProductState {
  ProductPriceListMobileErrorState({required super.list});
}
