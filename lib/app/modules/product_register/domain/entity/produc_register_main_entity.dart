import 'package:appweb/app/modules/product_register/domain/entity/product_price_list_entity.dart';
import 'package:appweb/app/modules/product_register/domain/entity/product_register_entity.dart';

class ProductRegisterMainEntity {
  ProductRegisterEntity product;
  List<ProductPriceListEntity> priceList;

  ProductRegisterMainEntity({
    required this.product,
    required this.priceList,
  });
}
