import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/entity/product_model.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_stock_transfer_register/domain/repository/order_stock_transfer_register_repository.dart';
import 'package:dartz/dartz.dart';

class ProductGetlist
    implements UseCase<List<ProductModel>, ParamsGetlistProduct> {
  final OrderStockTransferRegisterRepository repository;

  ProductGetlist({required this.repository});

  @override
  Future<Either<Failure, List<ProductModel>>> call(
      ParamsGetlistProduct params) async {
    try {
      final list =
          await repository.getListProduct(institutionId: params.institutionId);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGetlistProduct {
  int institutionId;
  ParamsGetlistProduct({required this.institutionId});
}
