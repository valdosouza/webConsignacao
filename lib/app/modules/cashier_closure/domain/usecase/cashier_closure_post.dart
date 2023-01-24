import 'package:dartz/dartz.dart';

import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/cashier_closure/data/model/closure_model.dart';
import 'package:appweb/app/modules/cashier_closure/domain/repository/cashier_closure_repository.dart';

class CashierClosurePost
    implements UseCase<ClosureModel, ParamsCashierClosurePost> {
  CashierClosurePost({
    required this.repository,
  });

  final CashierClosureRepository repository;

  @override
  Future<Either<Failure, ClosureModel>> call(
      ParamsCashierClosurePost params) async {
    try {
      final closure = await repository.postClosure(param: params);
      return closure;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsCashierClosurePost {
  final ClosureModel model;
  const ParamsCashierClosurePost({
    required this.model,
  });
}
