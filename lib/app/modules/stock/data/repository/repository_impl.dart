import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/cashier_status_model.dart';
import 'package:appweb/app/modules/stock/data/datasource/datasource.dart';
import 'package:appweb/app/modules/stock/domain/repository/respository.dart';
import 'package:dartz/dartz.dart';

class RepositoryImpl implements Repository {
  final DataSource datasource;

  RepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, CashierStatusModel>> cashierIsOpen() async {
    try {
      final result = await datasource.cashierIsOpen();
      return Right(result);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
