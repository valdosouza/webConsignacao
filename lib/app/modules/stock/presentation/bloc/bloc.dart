import 'package:appweb/app/core/shared/helpers/local_storage.dart';
import 'package:appweb/app/core/shared/local_storage_key.dart';
import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/stock/domain/usecase/cashier_is_open.dart';
import 'package:appweb/app/modules/stock/presentation/bloc/event.dart';
import 'package:appweb/app/modules/stock/presentation/bloc/state.dart';
import 'package:bloc/bloc.dart';

class StockBloc extends Bloc<StockEvent, StockState> {
  final CashierIsOpen cashierIsOpen;

  StockBloc({
    required this.cashierIsOpen,
  }) : super(InitState()) {
    _validateOrderLoad();
  }

  void _validateOrderLoad() {
    on<ValidateOrderLoadEvent>((event, emit) async {
      emit(LoadingState());
      Object result = "";
      result = await _cashierIsOpen();
      emit(ValidateOrderLoadState(msg: result.toString()));
    });
  }

  Future<Object> _cashierIsOpen() async {
    var dtCurrent = CustomDate.newDate();
    var dtCashier = "";
    var response = await cashierIsOpen.call(ParamsCashierIsOpen());

    return response.fold((l) {
      return l;
    }, (r) async {
      dtCashier = r.dtRecord;
      String finalMessage = "";
      if (r.status == "A") {
        if (r.dtRecord == dtCurrent) {
          finalMessage = "Aberto";
        } else {
          finalMessage = "Por favor faça o encerramento";
        }
      } else {
        if (r.status == "F") {
          if (r.dtRecord == dtCurrent) {
            finalMessage = "Caixa Fechado - Aguarde próximo dia.";
          } else {
            //Caixa será aberto automaticamente
            dtCashier = dtCurrent;
            finalMessage = "Aberto";
          }
        } else {
          //Caixa será aberto automaticamente
          dtCashier = dtCurrent;
          finalMessage = "Aberto";
        }
      }
      await LocalStorageService.instance
          .saveItem(key: LocalStorageKey.dtCashier, value: dtCashier);
      return finalMessage;
    });
  }
}
