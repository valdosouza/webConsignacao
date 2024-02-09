import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/cashier_statement_summary/data/model/params.dart';
import 'package:appweb/app/modules/cashier_statement_summary/data/model/salesman_model.dart';
import 'package:appweb/app/modules/cashier_statement_summary/data/model/summary_model.dart';
import 'package:dartz/dartz.dart';

abstract class Repository {
  Future<Either<Failure, List<SummaryModel>>> get({required Params params});

  Future<Either<Failure, List<SalesmanModel>>> getSalesman();
}
