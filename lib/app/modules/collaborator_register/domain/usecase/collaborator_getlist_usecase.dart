import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/usecase/usecase.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/collaborator_model.dart';
import 'package:appweb/app/modules/collaborator_register/domain/entity/collaborator_entity.dart';
import 'package:appweb/app/modules/collaborator_register/domain/repository/collaborator_register_respository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class CollaboratorGetlist implements UseCase<List<CollaboratorModel>, ParamsGetlist> {
  final CollaboratorRegisterRespository repository;

  CollaboratorGetlist({required this.repository});

  @override
  Future<Either<Failure, List<CollaboratorModel>>> call(ParamsGetlist params) async {
    try {
      final response = await repository.getlistCollaborator(institution: params.institution);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGetlist extends Equatable {
  final int institution;

  const ParamsGetlist({
    required this.institution,
  });

  @override
  List<Object?> get props => [institution];
}
