import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/line_business_register/domain/repository/linebusiness_register_repository.dart';
import 'package:dartz/dartz.dart';

class LinebusinessRegisterDelete
    implements UseCase<String, ParamsLinebusinessDelete> {
  final LinebusinessRegisterRepository repository;

  LinebusinessRegisterDelete({required this.repository});

  @override
  Future<Either<Failure, String>> call(ParamsLinebusinessDelete params) async {
    try {
      final list = await repository.delete(id: params.id);
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsLinebusinessDelete {
  int id;
  ParamsLinebusinessDelete({required this.id});
}
