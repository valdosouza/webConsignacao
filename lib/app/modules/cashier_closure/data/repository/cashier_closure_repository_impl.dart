import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/modules/cashier_closure/data/datasource/cashier_closure_datasource.dart';
import 'package:appweb/app/modules/cashier_closure/data/model/cashier_closure_previously_model.dart';
import 'package:appweb/app/modules/cashier_closure/data/model/closure_model.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/cashier_closure/domain/respository/cashier_closure_repository.dart';
import 'package:dartz/dartz.dart';

class CashierClosureRepositoryImpl implements CashierClosureRepository {
  CashierClosureRepositoryImpl({
    required this.datasource,
  });
  final CashierClosureDatasource datasource;

  @override
  Future<Either<Failure, ClosureModel>> getClosure({
    required int institutionId,
    required int userId,
    required DateTime date,
  }) async {
    try {
      final closureToday = await datasource.getClosure(
        institutionId: institutionId,
        userId: userId,
        date: date,
      );
      return Right(closureToday);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<CashierClosurePreviously>>> closurePreviously({
    required int institutionId,
    required int userId,
  }) async {
    try {
      final closurePreviously = await datasource.closurePreviously(
        institutionId: institutionId,
        userId: userId,
      );
      return Right(closurePreviously);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
