import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/usecase/usecase.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/collaborator_model.dart';
import 'package:appweb/app/modules/collaborator_register/domain/entity/collaborator_entity.dart';
import 'package:appweb/app/modules/collaborator_register/domain/repository/collaborator_register_respository.dart';
import 'package:appweb/app/modules/institution_register/data/model/institution_model.dart';
import 'package:appweb/app/modules/institution_register/domain/entity/institution_entity.dart';
import 'package:appweb/app/modules/institution_register/domain/repository/institution_register_respository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class CollaboratorRegisterSave implements UseCase<CollaboratorEntity, Params> {
  final CollaboratorRegisterRespository repository;

  CollaboratorRegisterSave({required this.repository});

  @override
  Future<Either<Failure, CollaboratorEntity>> call(Params params) async {
    try {
      final response = await repository.postCollaborator(model: params.model);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class Params extends Equatable {
  final CollaboratorModel model;

  const Params({
    required this.model,
  });

  @override
  List<Object?> get props => [model.id];
}
