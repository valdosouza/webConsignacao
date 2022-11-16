import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/product_register/data/model/product_register_main_model.dart';
import 'package:appweb/app/modules/product_register/domain/repository/product_register_respository.dart';
import 'package:dartz/dartz.dart';

class ProductRegisterPost
    implements UseCase<ProductRegisterMainModel, ParamsProductRegisterPost> {
  final ProductRegisterRepository repository;

  ProductRegisterPost({required this.repository});

  @override
  Future<Either<Failure, ProductRegisterMainModel>> call(
      ParamsProductRegisterPost params) async {
    try {
      final response = await repository.post(model: params.model);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsProductRegisterPost {
  ProductRegisterMainModel model;
  ParamsProductRegisterPost({required this.model});
}
