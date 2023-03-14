import 'package:appweb/app/modules/Core/domain/repository/get_state_respository.dart';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/Core/data/model/state_model.dart';
import 'package:dartz/dartz.dart';

class GetStates implements UseCase<List<StateModel>, ParamsGetStates> {
  final GetStateRepository repository;

  GetStates({required this.repository});

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
