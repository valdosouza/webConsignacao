import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/product_register/data/model/product_register_main_model.dart';
import 'package:appweb/app/modules/product_register/domain/repository/product_register_respository.dart';
import 'package:dartz/dartz.dart';

class ProductRegisterGet
    implements UseCase<ProductRegisterMainModel, ParamsProductRegisterGet> {
  final ProductRegisterRepository repository;

  ProductRegisterGet({required this.repository});

  @override
  Future<Either<Failure, ProductRegisterMainModel>> call(
      ParamsProductRegisterGet params) async {
    try {
      final list = await repository.get(
          intitutionId: params.intitutionId, productId: params.productId);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsProductRegisterGet {
  int intitutionId;
  int productId;
  ParamsProductRegisterGet({
    required this.intitutionId,
    required this.productId,
  });
}
