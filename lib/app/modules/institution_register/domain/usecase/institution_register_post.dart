import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/institution_register/data/model/institution_model.dart';
import 'package:appweb/app/modules/institution_register/domain/entity/institution_entity.dart';
import 'package:appweb/app/modules/institution_register/domain/repository/institution_register_respository.dart';
import 'package:dartz/dartz.dart';

class InstitutionRegisterSave
    implements UseCase<InstitutionEntity, ParamsPostInstitution> {
  final InstitutionRegisterRespository repository;

  InstitutionRegisterSave({required this.repository});

  @override
  Future<Either<Failure, InstitutionEntity>> call(
      ParamsPostInstitution params) async {
    try {
      final response = await repository.post(model: params.model);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsPostInstitution {
  final InstitutionModel model;

  const ParamsPostInstitution({
    required this.model,
  });
}
