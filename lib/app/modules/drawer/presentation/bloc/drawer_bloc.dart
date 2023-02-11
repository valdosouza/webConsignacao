import 'package:appweb/app/core/shared/helpers/local_storage.dart';
import 'package:appweb/app/core/shared/local_storage_key.dart';
import 'package:appweb/app/core/shared/utils/custom_date.dart';
import 'package:appweb/app/modules/drawer/domain/usecase/drawer_cashier_is_open.dart';
import 'package:appweb/app/modules/drawer/presentation/bloc/drawer_event.dart';
import 'package:appweb/app/modules/drawer/presentation/bloc/drawer_state.dart';
import 'package:bloc/bloc.dart';

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
      var dtCashier = await LocalStorageService.instance
          .get(key: LocalStorageKey.dtCashier);
      if (dtCashier == null) {
        dtCashier = CustomDate.newDate();
        //abrir o caixa
        await LocalStorageService.instance
            .saveItem(key: LocalStorageKey.dtCashier, value: dtCashier);
      }

      var dtCurrent = CustomDate.newDate();
      if (dtCurrent != dtCashier) {
        var response =
            await drawerCashierIsOpen.call(ParamsDrawerCashierIsOpen());

        var result = response.fold((l) => GetErrorState(), (r) {
          return DrawerCashierIsOpenState(open: r);
        });
        emit(result);
      } else {
        emit(DrawerCashierIsOpenState(open: false));
      }
    });
  }

  userLogged() {
    on<UserLoggedEvent>((event, emit) async {
      userName =
          await LocalStorageService.instance.get(key: LocalStorageKey.userName);
    });
  }
}
