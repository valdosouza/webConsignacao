import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/collaborator_register/data/model/collaborator_main_model.dart';
import 'package:appweb/app/modules/collaborator_register/domain/repository/collaborator_register_respository.dart';
import 'package:dartz/dartz.dart';

class CollaboratorRegisterPost
    implements UseCase<CollaboratorMainModel, ParamsPostCollaborator> {
  final CollaboratorRegisterRepository repository;

  CollaboratorRegisterPost({required this.repository});

  @override
  Future<Either<Failure, CollaboratorMainModel>> call(
      ParamsPostCollaborator params) async {
    try {
      final model = await repository.post(model: params.model);
      return model;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsPostCollaborator {
  CollaboratorMainModel model;
  ParamsPostCollaborator({required this.model});
}
