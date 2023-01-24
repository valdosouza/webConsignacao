import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/modules/cashier_closure/data/datasource/cashier_closure_datasource.dart';
import 'package:appweb/app/modules/cashier_closure/data/model/cashier_closure_previously_model.dart';
import 'package:appweb/app/modules/cashier_closure/data/model/closure_model.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/cashier_closure/domain/repository/cashier_closure_repository.dart';
import 'package:appweb/app/modules/cashier_closure/domain/usecase/cashier_closure_post.dart';
import 'package:dartz/dartz.dart';

class CashierClosureRepositoryImpl implements CashierClosureRepository {
  CashierClosureRepositoryImpl({
    required this.datasource,
  });
  final CashierClosureDatasource datasource;

  @override
  Future<Either<Failure, ClosureModel>> getClosure({
    required String date,
  }) async {
    try {
      final closureToday = await datasource.getClosure(
        date: date,
      );
      return Right(closureToday);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<CashierClosurePreviouslyModel>>>
      closurePreviously() async {
    try {
      final closurePreviously = await datasource.closurePreviously();
      return Right(closurePreviously);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, ClosureModel>> postClosure(
      {required ParamsCashierClosurePost param}) async {
    try {
      final closurePost = await datasource.postClosure(param: param);
      return Right(closurePost);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
