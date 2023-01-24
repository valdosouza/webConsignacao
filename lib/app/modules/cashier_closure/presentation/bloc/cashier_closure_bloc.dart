import 'package:appweb/app/core/shared/helpers/local_storage.dart';
import 'package:appweb/app/core/shared/local_storage_key.dart';
import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/cashier_closure/data/model/cashier_closure_previously_model.dart';
import 'package:appweb/app/modules/cashier_closure/data/model/closure_model.dart';
import 'package:appweb/app/modules/cashier_closure/domain/usecase/cashier_closure_get_previously.dart';
import 'package:appweb/app/modules/cashier_closure/domain/usecase/cashier_closure_get_today.dart';
import 'package:appweb/app/modules/cashier_closure/domain/usecase/cashier_closure_post.dart';
import 'package:bloc/bloc.dart';

part 'cashier_closure_event.dart';
part 'cashier_closure_state.dart';

class CashierClosureBloc
    extends Bloc<CashierClosureEvent, CashierClosureState> {
  CashierClosureBloc({
    required this.cashierClosureGet,
    required this.cashierClosureGetPreviously,
    required this.cashierClosurePost,
  }) : super(CashierClosureLoadingState()) {
    on<CashierClosureGetClosureEvent>(getClosure);
    on<CashierClosureGetClosurePreviouslyEvent>(getPreviously);
    on<CashierClosureGetClosureOnSearchEvent>(onSearch);
    on<CashierClosurePostClosureEvent>(postClosure);
  }

  final CashierClosureGet cashierClosureGet;
  final CashierClosureGetPreviously cashierClosureGetPreviously;
  final CashierClosurePost cashierClosurePost;
  List<CashierClosurePreviouslyModel> closuresPreviously = [];
  late ClosureModel closureModel = ClosureModel.isEmpty();

  void onSearch(
    CashierClosureGetClosureOnSearchEvent event,
    Emitter<CashierClosureState> emit,
  ) async {
    emit(CashierClosureLoadingState());

    late List<CashierClosurePreviouslyModel> closuresSearched;

    closuresSearched = closuresPreviously.where((element) {
      String dtRecord = element.dtRecord;
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
    final response = await cashierClosureGet.call(ParamsGet(date: event.date));

    emit(
      response.fold((l) => CashierClosureGetClosureErrorState(), (r) {
        closureModel = r;
        return const CashierClosureGetClosureLoadedState();
      }),
    );
  }

  void postClosure(
    CashierClosurePostClosureEvent event,
    Emitter<CashierClosureState> emit,
  ) async {
    emit(CashierClosureLoadingState());
    //depois de Gravar o Fechamento precisa alterar a data
    //Verificar se o usuario está fechando o caixa no mesmo dia ou no dia seguinte.
    //Isso vai afetar a liberação de tela para uso no dia seguinte do dia do caixa fechado.

    final response = await cashierClosurePost
        .call(ParamsCashierClosurePost(model: closureModel));

    var result =
        response.fold((l) => CashierClosureGetClosureErrorState(), (r) {
      closureModel = r;
      return CashierClosurePostSucessState();
    });
    if (result == CashierClosurePostSucessState()) {
      var dtCashier = await LocalStorageService.instance
          .get(key: LocalStorageKey.dtCashier);
      var dtCurrent = CustomDate.newDate();
      if (dtCurrent == dtCashier) {
        await LocalStorageService.instance.saveItem(
            key: LocalStorageKey.dtCashier, value: CustomDate.tomorrow());
      } else {
        //abrir o caixa
        await LocalStorageService.instance
            .saveItem(key: LocalStorageKey.dtCashier, value: dtCurrent);
      }
    }
    emit(result);
  }

  void getPreviously(
    CashierClosureGetClosurePreviouslyEvent event,
    Emitter<CashierClosureState> emit,
  ) async {
    emit(CashierClosureLoadingState());
    if (closuresPreviously.isEmpty) {
      emit(CashierClosureLoadingState());
      final response =
          await cashierClosureGetPreviously.call(const ParamsGetPreviously());
      emit(
        response.fold((l) => CashierClosureGetClosureErrorState(), (r) {
          closuresPreviously = r;
          return CashierClosureGetClosurePreviouslyLoadedState(
            closures: r,
          );
        }),
      );
    }
  }
}
