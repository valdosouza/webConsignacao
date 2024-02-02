import 'package:appweb/app/core/shared/helpers/local_storage.dart';
import 'package:appweb/app/core/shared/local_storage_key.dart';
import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/drawer/domain/usecase/drawer_cashier_is_open.dart';
import 'package:appweb/app/modules/drawer/domain/usecase/drawer_order_load_exist.dart';
import 'package:appweb/app/modules/drawer/presentation/bloc/drawer_event.dart';
import 'package:appweb/app/modules/drawer/presentation/bloc/drawer_state.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';

class DrawerBloc extends Bloc<DrawerEvent, DrawerState> {
  final DrawerCashierIsOpen drawerCashierIsOpen;
  final DrawerOrderLoadExist drawerOrderLoadExist;

  String userName = "";

  DrawerBloc({
    required this.drawerCashierIsOpen,
    required this.drawerOrderLoadExist,
  }) : super(DrawerInitState()) {
    _userLogged();
    _validateOrderAttendance();
    on<DrawerLogoutEvent>((event, emit) async {
      await LocalStorageService.instance
          .saveItem(key: LocalStorageKey.token, value: '');
      await LocalStorageService.instance
          .saveItem(key: LocalStorageKey.tbInstitutionId, value: '0');
      await LocalStorageService.instance
          .saveItem(key: LocalStorageKey.tbUserId, value: '0');
      await LocalStorageService.instance
          .saveItem(key: LocalStorageKey.keepConnected, value: false);
      emit(DrawerLogoutState(logged: false));
      // }
    });
  }

  _validateOrderAttendance() {
    on<ValidateOrderAttendanceEvent>((event, emit) async {
      emit(LoadingState());
      var result = "";
      result = await _cashierIsOpen();
      if (result == "Aberto") {
        result = await _orderLoadExist();
      }
      emit(ValidateOrderAttendanceState(msg: result));
    });
  }

  _cashierIsOpen() async {
    var dtCurrent = CustomDate.newDate();
    var dtCashier = "";
    var response = await drawerCashierIsOpen.call(ParamsDrawerCashierIsOpen());

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

  _orderLoadExist() async {
    try {
      var response =
          await drawerOrderLoadExist.call(ParamsDrawerOrderLoadExist());

      return response.fold((l) {
        return l.toString();
      }, (r) {
        String finalMessage = "";
        if (r.id > 0) {
          finalMessage = "Aberto";
        } else {
          finalMessage = "Por favor efetue um carregamento";
        }
        return finalMessage;
      });
    } catch (error, s) {
      await FirebaseCrashlytics.instance
          .recordError(error, s, reason: 'Try to get a orderLoadExist');
    }
  }

  _userLogged() {
    on<UserLoggedEvent>((event, emit) async {
      emit(LoadingState());
      try {
        userName = await LocalStorageService.instance
            .get(key: LocalStorageKey.userName);
      } catch (error, s) {
        await FirebaseCrashlytics.instance
            .recordError(error, s, reason: 'Try to get a UserLogged');
      }

      emit(GetSucessState());
    });
  }
}
