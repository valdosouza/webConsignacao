import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/product_register/data/model/product_register_model.dart';
import 'package:appweb/app/modules/product_register/domain/repository/product_register_respository.dart';
import 'package:dartz/dartz.dart';

class ProductRegisterGetlist
    implements
        UseCase<List<ProductRegisterModel>, ParamsProductRegisterGetlist> {
  final ProductRegisterRepository repository;

  ProductRegisterGetlist({required this.repository});

  @override
  Future<Either<Failure, List<ProductRegisterModel>>> call(
      ParamsProductRegisterGetlist params) async {
    try {
      final list = await repository.getList(id: params.id);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsProductRegisterGetlist {
  int id;
  ParamsProductRegisterGetlist({required this.id});
}
