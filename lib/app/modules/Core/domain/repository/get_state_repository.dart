import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/state_model.dart';
import 'package:dartz/dartz.dart';

abstract class GetStateRepository {
  Future<Either<Failure, List<StateModel>>> getStates();
}
