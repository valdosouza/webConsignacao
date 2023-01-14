import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:appweb/app/modules/cashier_closure/data/model/closure_model.dart';
import 'package:appweb/app/modules/cashier_closure/domain/respository/cashier_closure_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class CashierClosureGet implements UseCase<ClosureModel, ParamsGet> {
  CashierClosureGet({
    required this.repository,
  });

  final CashierClosureRepository repository;

  @override
  Future<Either<Failure, ClosureModel>> call(ParamsGet params) async {
    try {
      final closure = await repository.getClosure(
        institutionId: params.institutionId,
        userId: params.userId,
        date: params.date,
      );
      return closure;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGet extends Equatable {
  final int institutionId;
  final int userId;
  final DateTime date;

  const ParamsGet({
    required this.institutionId,
    required this.userId,
    required this.date,
  });

  @override
  List<Object?> get props => [institutionId];
}
