import 'package:appweb/app/core/shared/helpers/local_storage.dart';
import 'package:appweb/app/core/shared/local_storage_key.dart';
import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/drawer/domain/usecase/drawer_cashier_is_open.dart';
import 'package:appweb/app/modules/drawer/presentation/bloc/drawer_event.dart';
import 'package:appweb/app/modules/drawer/presentation/bloc/drawer_state.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class DrawerBloc extends Bloc<DrawerEvent, DrawerState> {
  final DrawerCashierIsOpen drawerCashierIsOpen;

  String userName = "";

  DrawerBloc({
    required this.drawerCashierIsOpen,
  }) : super(DrawerInitState()) {
    cashierIsOpen();
    userLogged();

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

  cashierIsOpen() {
    on<CashierIsOpenEvent>((event, emit) async {
      emit(LoadingState());
      var dtCurrent = CustomDate.newDate();
      var dtCashier = "";
      var response =
          await drawerCashierIsOpen.call(ParamsDrawerCashierIsOpen());

      var result = response.fold((l) {
        return GetErrorState(error: l.toString());
      }, (r) {
        dtCashier = r.dtRecord;

        if (r.status == "A") {
          if (r.dtRecord == dtCurrent) {
            return DrawerCashierStatusState(msg: "Aberto");
          } else {
            return DrawerCashierStatusState(
                msg: "Por favor faça o encerramento");
          }
        } else {
          if (r.status == "F") {
            if (r.dtRecord == dtCurrent) {
              return DrawerCashierStatusState(
                  msg: "Caixa Fechado - Aguarde próximo dia.");
            } else {
              //Caixa será aberto automaticamente
              return DrawerCashierStatusState(msg: "Aberto");
            }
          } else {
            //Caixa será aberto automaticamente
            return DrawerCashierStatusState(msg: "Aberto");
          }
        }
      });
      await LocalStorageService.instance
          .saveItem(key: LocalStorageKey.dtCashier, value: dtCashier);
      emit(result);
    });
  }

  userLogged() {
    on<UserLoggedEvent>((event, emit) async {
      emit(LoadingState());
      try {
        userName = await LocalStorageService.instance
            .get(key: LocalStorageKey.userName);
      } catch (e) {
        debugPrint('Erro no Drawer $e');
      }

      emit(GetSucessState());
    });
  }
}
