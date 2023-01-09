import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/institution_register/data/model/institution_model.dart';
import 'package:appweb/app/modules/institution_register/domain/repository/institution_register_respository.dart';
import 'package:dartz/dartz.dart';

class InstitutionPut implements UseCase<InstitutionModel, ParamsPut> {
  final InstitutionRegisterRespository repository;

  InstitutionPut({required this.repository});

  @override
  Future<Either<Failure, InstitutionModel>> call(ParamsPut params) async {
    try {
      final response = await repository.put(model: params.model);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsPut {
  final InstitutionModel model;

  const ParamsPut({
    required this.model,
  });
}
