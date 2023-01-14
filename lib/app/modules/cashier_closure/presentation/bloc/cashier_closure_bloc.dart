import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/cashier_closure/data/model/cashier_closure_previously_model.dart';
import 'package:appweb/app/modules/cashier_closure/data/model/closure_model.dart';
import 'package:appweb/app/modules/cashier_closure/domain/usecase/cashier_closure_get_previously.dart';
import 'package:appweb/app/modules/cashier_closure/domain/usecase/cashier_closure_get_today.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'cashier_closure_event.dart';
part 'cashier_closure_state.dart';

class CashierClosureBloc
    extends Bloc<CashierClosureEvent, CashierClosureState> {
  CashierClosureBloc({
    required this.cashierClosureGet,
    required this.cashierClosureGetPreviously,
  }) : super(CashierClosureLoadingState()) {
    on<CashierClosureGetClosureEvent>(getClosure);
    on<CashierClosureGetClosurePreviouslyEvent>(getPreviously);
    on<CashierClosureGetClosureOnSearchEvent>(onSearch);
  }

  final CashierClosureGet cashierClosureGet;
  final CashierClosureGetPreviously cashierClosureGetPreviously;
  List<CashierClosurePreviously> _closures = [];

  void onSearch(
    CashierClosureGetClosureOnSearchEvent event,
    Emitter<CashierClosureState> emit,
  ) async {
    emit(CashierClosureLoadingState());

    late List<CashierClosurePreviously> closuresSearched;

    closuresSearched = _closures.where((element) {
      String dtRecord =
          CustomDate.formatDate(element.dtRecord.toString(), 'dd/MM/yyyy');
      return dtRecord
          .toLowerCase()
          .trim()
          .contains(event.value.toLowerCase().trim());
    }).toList();

    emit(
      CashierClosureGetClosurePreviouslyLoadedState(closures: closuresSearched),
    );
  }

  void getClosure(
    CashierClosureGetClosureEvent event,
    Emitter<CashierClosureState> emit,
  ) async {
    emit(CashierClosureLoadingState());
    final response = await cashierClosureGet.call(
      ParamsGet(
        date: event.date,
        institutionId: event.institutionId,
        userId: event.userId,
      ),
    );

    emit(
      response.fold((l) => CashierClosureGetClosureErrorState(), (r) {
        return CashierClosureGetClosureLoadedState(
          closure: r,
        );
      }),
    );
  }

  void getPreviously(
    CashierClosureGetClosurePreviouslyEvent event,
    Emitter<CashierClosureState> emit,
  ) async {
    emit(CashierClosureLoadingState());
    final response = await cashierClosureGetPreviously.call(
      ParamsGetPreviously(
        institutionId: event.institutionId,
        userId: event.userId,
      ),
    );

    emit(
      response.fold((l) => CashierClosureGetClosureErrorState(), (r) {
        _closures = r;
        return CashierClosureGetClosurePreviouslyLoadedState(
          closures: r,
        );
      }),
    );
  }
}
