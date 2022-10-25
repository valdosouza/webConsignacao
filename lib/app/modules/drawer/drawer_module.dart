import 'package:appweb/app/modules/drawer/presentation/bloc/drawer_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class DrawerModule extends Module {
  @override
  List<Bind> get binds => [
        BlocBind.singleton((i) => DrawerBloc()),
      ];
  @override
  List<ModularRoute> get routes => [];
}
