import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/usecase/usecase.dart';
import 'package:appweb/app/modules/collaborator_register/domain/repository/collaborator_register_respository.dart';
import 'package:appweb/app/modules/institution_register/data/model/state_model.dart';
import 'package:appweb/app/modules/institution_register/domain/repository/institution_register_respository.dart';
import 'package:dartz/dartz.dart';

class CollaboratorGetStates
    implements UseCase<List<StateModel>, ParamsGetStates> {
  final CollaboratorRegisterRespository repository;

  CollaboratorGetStates({required this.repository});

  @override
  Future<Either<Failure, List<StateModel>>> call(ParamsGetStates params) async {
    try {
      final response = await repository.getStates();
      return response;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGetStates {}
