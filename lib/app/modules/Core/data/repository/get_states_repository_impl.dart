import 'package:appweb/app/modules/Core/data/datasource/get_states_datasource.dart';
import 'package:appweb/app/modules/Core/domain/repository/get_state_repository.dart';
import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/state_model.dart';
import 'package:dartz/dartz.dart';

class GetStatesRepositoryImpl implements GetStateRepository {
  final GetStatesDatasource datasource;

  GetStatesRepositoryImpl({
    required this.datasource,
  });

  @override
  Future<Either<Failure, List<StateModel>>> getStates() async {
    try {
      List<StateModel> states = await datasource.getStates();
      return Right(states);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
