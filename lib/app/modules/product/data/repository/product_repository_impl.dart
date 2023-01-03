import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/product/data/datasource/product_datasource.dart';
import 'package:appweb/app/modules/product/domain/entity/produtcs_price_list_product_entity.dart';
import 'package:appweb/app/modules/product/domain/repository/product_respository.dart';
import 'package:dartz/dartz.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductDataSource datasource;

  ProductRepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, List<ProductsPriceListEntity>>> getPriceList(
      {required int id}) async {
    try {
      final list = await datasource.getPriceList(tbInstitutionId: id);
      return Right(list);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
