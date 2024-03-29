import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/product/domain/entity/produtcs_price_list_product_entity.dart';
import 'package:appweb/app/modules/product/domain/repository/product_respository.dart';
import 'package:dartz/dartz.dart';

class PricesListGet
    implements UseCase<List<ProductsPriceListEntity>, ParamsPricesListGet> {
  final ProductRepository repository;

  PricesListGet({required this.repository});

  @override
  Future<Either<Failure, List<ProductsPriceListEntity>>> call(
      ParamsPricesListGet params) async {
    try {
      final list = await repository.getPriceList();
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsPricesListGet {
  ParamsPricesListGet();
}
