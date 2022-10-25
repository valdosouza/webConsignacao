import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/usecase/usecase.dart';
import 'package:appweb/app/modules/institution_register/data/model/institution_model.dart';
import 'package:appweb/app/modules/institution_register/domain/entity/institution_entity.dart';
import 'package:appweb/app/modules/institution_register/domain/repository/institution_register_respository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class InstitutionRegisterSave implements UseCase<InstitutionEntity, Params> {
  final InstitutionRegisterRespository repository;

  InstitutionRegisterSave({required this.repository});

  @override
  Future<Either<Failure, InstitutionEntity>> call(Params params) async {
    try {
      final response = await repository.postInstitution(model: params.model);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class Params extends Equatable {
  final InstitutionModel model;

  const Params({
    required this.model,
  });

  @override
  List<Object?> get props => [model.id];
}
