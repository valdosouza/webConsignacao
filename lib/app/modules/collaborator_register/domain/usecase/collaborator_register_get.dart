import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/collaborator_main_model.dart';
import 'package:appweb/app/modules/collaborator_register/domain/repository/collaborator_register_respository.dart';
import 'package:dartz/dartz.dart';

class CollaboratorRegisterGet
    implements UseCase<CollaboratorMainModel, ParamsGetCollaborator> {
  final CollaboratorRegisterRepository repository;

  CollaboratorRegisterGet({required this.repository});

  @override
  Future<Either<Failure, CollaboratorMainModel>> call(
      ParamsGetCollaborator params) async {
    try {
      final model = await repository.get(id: params.id);
      return model;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGetCollaborator {
  int id;
  ParamsGetCollaborator({required this.id});
}
