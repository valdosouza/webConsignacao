import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/usecase/usecase.dart';
import 'package:appweb/app/modules/collaborator_register/domain/entity/collaborator_entity.dart';
import 'package:appweb/app/modules/collaborator_register/domain/repository/collaborator_register_respository.dart';
import 'package:appweb/app/modules/institution_register/domain/entity/institution_entity.dart';
import 'package:appweb/app/modules/institution_register/domain/repository/institution_register_respository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class CollaboratorRegisterGet implements UseCase<CollaboratorEntity, ParamsGet> {
  final CollaboratorRegisterRespository repository;

  CollaboratorRegisterGet({required this.repository});

  @override
  Future<Either<Failure, CollaboratorEntity>> call(ParamsGet params) async {
    try {
      final response = await repository.getCollaborator(id: params.id);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGet extends Equatable {
  final int id;

  const ParamsGet({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}
