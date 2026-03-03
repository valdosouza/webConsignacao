import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/Core/data/model/cashier_status_model.dart';
import 'package:appweb/app/modules/cashier_closure/data/model/cashier_closure_previously_model.dart';
import 'package:appweb/app/modules/cashier_closure/data/model/closure_model.dart';
import 'package:appweb/app/modules/cashier_closure/domain/repository/cashier_closure_repository.dart';
import 'package:appweb/app/modules/cashier_closure/domain/usecase/cashier_closure_get_current_date.dart';
import 'package:appweb/app/modules/cashier_closure/domain/usecase/cashier_closure_get_for.dart';
import 'package:appweb/app/modules/cashier_closure/domain/usecase/cashier_closure_get_previously.dart';
import 'package:appweb/app/modules/cashier_closure/domain/usecase/cashier_closure_get_today.dart';
import 'package:appweb/app/modules/cashier_closure/domain/usecase/cashier_closure_post.dart';
import 'package:appweb/app/modules/cashier_closure/presentation/bloc/cashier_closure_bloc.dart';
import 'package:dartz/dartz.dart';

/// Fake repository for cashier closure tests. [dtRecordForToday] is returned by cashierClosureGetCurrentDate().
class FakeCashierClosureRepository implements CashierClosureRepository {
  FakeCashierClosureRepository({this.dtRecordForToday = '24/02/2025'});

  final String dtRecordForToday;

  @override
  Future<Either<Failure, ClosureModel>> getClosure({required String date}) async =>
      Right(ClosureModel.isEmpty());

  @override
  Future<Either<Failure, ClosureModel>> getForClosure({required String date}) async =>
      Right(ClosureModel.isEmpty());

  @override
  Future<Either<Failure, List<CashierClosurePreviouslyModel>>> closurePreviously() async =>
      Right([]);

  @override
  Future<Either<Failure, String>> postClosure(
      {required dynamic param}) async =>
      const Right('ok');

  @override
  Future<Either<Failure, CashierStatusModel>> cashierClosureGetCurrentDate() async =>
      Right(CashierStatusModel(dtRecord: dtRecordForToday, status: 'A'));
}

/// Bloc for widget tests. Uses [FakeCashierClosureRepository] so getCurrentDate returns [dtRecordForToday].
CashierClosureBloc createFakeCashierClosureBloc({String dtRecordForToday = '24/02/2025'}) {
  final repo = FakeCashierClosureRepository(dtRecordForToday: dtRecordForToday);
  return CashierClosureBloc(
    cashierClosureGet: CashierClosureGet(repository: repo),
    cashierClosureGetPreviously: CashierClosureGetPreviously(repository: repo),
    cashierClosureGetFor: CashierClosureGetFor(repository: repo),
    cashierClosurePost: CashierClosurePost(repository: repo),
    getCurrentDate: CashierClosureGetCurrentDate(repository: repo),
  );
}
