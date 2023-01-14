import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/collaborator_register/domain/repository/collaborator_register_respository.dart';
import 'package:dartz/dartz.dart';

class CollaboratorregisterDelete implements UseCase<String, ParamsDelete> {
  final CollaboratorRegisterRepository repository;

  CollaboratorregisterDelete({required this.repository});

  @override
  Future<Either<Failure, String>> call(ParamsDelete params) async {
    try {
      final response = await repository.delete(id: params.id);
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsDelete {
  final int id;
  const ParamsDelete({required this.id});
}
