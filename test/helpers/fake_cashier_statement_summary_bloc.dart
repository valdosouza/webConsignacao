import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/cashier_statement_summary/data/model/params.dart';
import 'package:appweb/app/modules/cashier_statement_summary/data/model/salesman_model.dart';
import 'package:appweb/app/modules/cashier_statement_summary/data/model/summary_model.dart';
import 'package:appweb/app/modules/cashier_statement_summary/domain/repository/respository.dart';
import 'package:appweb/app/modules/cashier_statement_summary/domain/usecase/get.dart';
import 'package:appweb/app/modules/cashier_statement_summary/domain/usecase/get_salesmans.dart';
import 'package:appweb/app/modules/cashier_statement_summary/presentation/bloc/bloc.dart';
import 'package:dartz/dartz.dart';

/// Fake repository for cashier statement summary tests.
class FakeCashierStatementSummaryRepository implements Repository {
  FakeCashierStatementSummaryRepository({
    this.summaryList = const [],
    this.salesmanList = const [],
  });

  final List<SummaryModel> summaryList;
  final List<SalesmanModel> salesmanList;

  @override
  Future<Either<Failure, List<SummaryModel>>> get({required Params params}) async =>
      Right(summaryList);

  @override
  Future<Either<Failure, List<SalesmanModel>>> getSalesman() async =>
      Right(salesmanList);
}

/// Creates a bloc for widget tests.
CashierStatementSummaryBloc createFakeCashierStatementSummaryBloc({
  List<SummaryModel>? summaryList,
  List<SalesmanModel>? salesmanList,
}) {
  final repo = FakeCashierStatementSummaryRepository(
    summaryList: summaryList ?? [],
    salesmanList: salesmanList ?? [],
  );
  return CashierStatementSummaryBloc(
    get: Get(repository: repo),
    getSalesmans: GetSalesmans(repository: repo),
  );
}
