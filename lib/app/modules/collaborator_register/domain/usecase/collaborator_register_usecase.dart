import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/usecase/usecase.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/collaborator_model.dart';
import 'package:appweb/app/modules/collaborator_register/domain/repository/collaborator_register_respository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class CollaboratorRegisterSave implements UseCase<String, Params> {
  final CollaboratorRegisterRespository repository;

  CollaboratorRegisterSave({required this.repository});

  @override
  Future<Either<Failure, String>> call(Params params) async {
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
