import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/order_production_register/data/model/product_model.dart';
import 'package:appweb/app/modules/order_production_register/domain/repository/order_production_register_respository.dart';
import 'package:dartz/dartz.dart';

class ProductGetlist
    implements
        UseCase<List<ProductModel>, ParamsProductGetlist> {
  final OrderProductionRegisterRepository repository;

  ProductGetlist({required this.repository});

  @override
  Future<Either<Failure, List<ProductModel>>> call(
      ParamsProductGetlist params) async {
    try {
      final list = await repository.getListProducts(id: params.id);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsProductGetlist {
  int id;
  ParamsProductGetlist({required this.id});
}
