import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/cashier_closure/data/model/cashier_closure_previously_model.dart';
import 'package:appweb/app/modules/cashier_closure/domain/respository/cashier_closure_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class CashierClosureGetPreviously
    implements UseCase<List<CashierClosurePreviously>, ParamsGetPreviously> {
  CashierClosureGetPreviously({
    required this.repository,
  });

  final CashierClosureRepository repository;

  @override
  Future<Either<Failure, List<CashierClosurePreviously>>> call(
      ParamsGetPreviously params) async {
    try {
      final list = await repository.closurePreviously(
        institutionId: params.institutionId,
        userId: params.userId,
      );
      return list;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGetPreviously extends Equatable {
  final int institutionId;
  final int userId;

  const ParamsGetPreviously({
    required this.institutionId,
    required this.userId,
  });

  @override
  List<Object?> get props => [institutionId, userId];
}
