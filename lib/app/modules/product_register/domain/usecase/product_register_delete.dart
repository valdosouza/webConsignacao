import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/product_register/domain/repository/product_register_respository.dart';
import 'package:dartz/dartz.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';

class ProductRegisterDelete
    implements UseCase<String, ParamsProductRegisterDelete> {
  final ProductRegisterRepository repository;

  ProductRegisterDelete({required this.repository});

  @override
  Future<Either<Failure, String>> call(
      ParamsProductRegisterDelete params) async {
    try {
      final list = await repository.delete(id: params.id);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsProductRegisterDelete {
  int id;
  ParamsProductRegisterDelete({required this.id});
}
