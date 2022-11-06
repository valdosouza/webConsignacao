import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/usecase/usecase.dart';
import 'package:appweb/app/modules/product_register/data/model/product_register_main_model.dart';
import 'package:appweb/app/modules/product_register/domain/repository/product_register_respository.dart';
import 'package:dartz/dartz.dart';

class ProductRegisterPut
    implements UseCase<ProductRegisterMainModel, ParamsProductRegisterPut> {
  final ProductRegisterRepository repository;

  ProductRegisterPut({required this.repository});

  @override
  Future<Either<Failure, ProductRegisterMainModel>> call(
      ParamsProductRegisterPut params) async {
    try {
      final list = await repository.put(model: params.model);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsProductRegisterPut {
  ProductRegisterMainModel model;
  ParamsProductRegisterPut({required this.model});
}
