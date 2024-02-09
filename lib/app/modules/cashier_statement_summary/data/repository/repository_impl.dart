import 'package:appweb/app/core/error/exceptions.dart';
import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/cashier_statement_summary/data/datasource/datasource.dart';
import 'package:appweb/app/modules/cashier_statement_summary/data/model/params.dart';
import 'package:appweb/app/modules/cashier_statement_summary/data/model/salesman_model.dart';
import 'package:appweb/app/modules/cashier_statement_summary/data/model/summary_model.dart';
import 'package:appweb/app/modules/cashier_statement_summary/domain/repository/respository.dart';
import 'package:dartz/dartz.dart';

class RepositoryImpl implements Repository {
  final DataSource datasource;

  RepositoryImpl({required this.datasource});

  @override
  Future<Either<Failure, List<SummaryModel>>> get(
      {required Params params}) async {
    try {
      final model = await datasource.get(params: params);
      return Right(model);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<SalesmanModel>>> getSalesman() async {
    try {
      final model = await datasource.getSalesmans();
      return Right(model);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
