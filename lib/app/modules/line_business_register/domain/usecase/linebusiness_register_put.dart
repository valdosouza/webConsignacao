import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/line_business_register/data/model/linebusiness_model.dart';
import 'package:appweb/app/modules/line_business_register/domain/repository/linebusiness_register_repository.dart';
import 'package:dartz/dartz.dart';

class LinebusinessRegisterPut
    implements UseCase<LinebusinessModel, ParamsLinebusinessPut> {
  final LinebusinessRegisterRepository repository;

  LinebusinessRegisterPut({required this.repository});

  @override
  Future<Either<Failure, LinebusinessModel>> call(
      ParamsLinebusinessPut params) async {
    try {
      final response = await repository.put(model: params.model);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsLinebusinessPut {
  LinebusinessModel model;
  ParamsLinebusinessPut({required this.model});
}
