import 'package:appweb/app/modules/drawer/presentation/bloc/drawer_event.dart';
import 'package:appweb/app/modules/drawer/presentation/bloc/drawer_state.dart';
import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DrawerBloc extends Bloc<DrawerEvent, DrawerState> {
  DrawerBloc() : super(DrawerInitState()) {
    on<DrawerLogoutEvent>((event, emit) async {
      final SharedPreferences sp = await SharedPreferences.getInstance();
      final bool result = sp.getString('token') != '';
      if (result) {
        await sp.setString('token', '');
        emit(DrawerLogoutState(logged: result));
      }
    });
  }
}
