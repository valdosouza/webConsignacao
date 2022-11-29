import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/line_business_register/data/model/linebusiness_model.dart';
import 'package:appweb/app/modules/line_business_register/domain/repository/linebusiness_register_repository.dart';
import 'package:dartz/dartz.dart';

class LinebusinessRegisterPost
    implements UseCase<LinebusinessModel, ParamsLinebusinessPost> {
  final LinebusinessRegisterRepository repository;

  LinebusinessRegisterPost({required this.repository});

  @override
  Future<Either<Failure, LinebusinessModel>> call(
      ParamsLinebusinessPost params) async {
    try {
      final response = await repository.post(model: params.model);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsLinebusinessPost {
  LinebusinessModel model;
  ParamsLinebusinessPost({required this.model});
}
