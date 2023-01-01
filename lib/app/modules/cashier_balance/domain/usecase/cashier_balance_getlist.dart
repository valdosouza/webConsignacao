import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/core/shared/style.dart';
import 'package:appweb/app/modules/Core/domain/usecase/usecase.dart';
import 'package:dartz/dartz.dart';

import '../entity/cashier_balance_entity.dart';
import '../repository/cashier_balance_respository.dart';

class Getlist implements UseCase<CashierBalanceEntity, ParamsGetlist> {
  final CashierBalanceRepository repository;

  Getlist({required this.repository});

  @override
  Future<Either<Failure, CashierBalanceEntity>> call(
      ParamsGetlist params) async {
    try {
      final model = await repository.getCashierBalance(
          id: params.id, date: params.date, userId: params.userId);
      return model;
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}

class ParamsGetlist {
  int id;
  String date;
  int userId;
  ParamsGetlist({required this.id, required this.date, required this.userId});
}
