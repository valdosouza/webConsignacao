import 'package:appweb/app/core/shared/helpers/local_storage.dart';
import 'package:appweb/app/core/shared/local_storage_key.dart';
import 'package:appweb/app/modules/drawer/presentation/bloc/drawer_event.dart';
import 'package:appweb/app/modules/drawer/presentation/bloc/drawer_state.dart';
import 'package:bloc/bloc.dart';

class DrawerBloc extends Bloc<DrawerEvent, DrawerState> {
  DrawerBloc() : super(DrawerInitState()) {
    on<DrawerLogoutEvent>((event, emit) async {
      final bool result = await LocalStorageService.instance
              .get(key: LocalStorageKey.token, defaultValue: '') !=
          '';
      if (result) {
        await LocalStorageService.instance
            .saveItem(key: LocalStorageKey.token, value: '');
        await LocalStorageService.instance
            .saveItem(key: LocalStorageKey.keepConnected, value: false);
        emit(DrawerLogoutState(logged: result));
      }
    });
  }
}
