import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/product/domain/entity/produtcs_price_list_product_entity.dart';

import 'package:dartz/dartz.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ProductsPriceListEntity>>> getPriceList();
}
