import 'package:appweb/app/core/error/failures.dart';
import 'package:appweb/app/modules/cashier_balance/data/model/cashier_balance_model.dart';
import 'package:appweb/app/modules/cashier_balance/domain/repository/cashier_balance_respository.dart';
import 'package:appweb/app/modules/cashier_balance/domain/usecase/cashier_balance_get.dart';
import 'package:appweb/app/modules/cashier_balance/presentation/bloc/cashier_balance_bloc.dart';
import 'package:appweb/app/modules/cashier_balance/presentation/bloc/cashier_balance_state.dart';
import 'package:dartz/dartz.dart';

/// Fake repository that returns [model] for tests.
class FakeCashierBalanceRepository implements CashierBalanceRepository {
  FakeCashierBalanceRepository({this.model});

  final CashierBalanceModel? model;

  @override
  Future<Either<Failure, CashierBalanceModel>> cashierBalanceGet(
      {required String date}) async {
    return Right(model ?? CashierBalanceModel.empty());
  }
}

/// Fake bloc for widget tests. Use [initialBalance] to control displayed data.
class FakeCashierBalanceBloc extends CashierBalanceBloc {
  FakeCashierBalanceBloc({CashierBalanceModel? initialBalance})
      : super(
          cashierbalance: CashierBalanceGet(
            repository: FakeCashierBalanceRepository(model: initialBalance),
          ),
        ) {
    if (initialBalance != null) {
      cashierBalance = initialBalance;
    }
  }

  void emitState(CashierBalanceState state) => emit(state);
}
