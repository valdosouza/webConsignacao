import 'package:appweb/app/modules/drawer/presentation/cubit/drawer_cubit.dart';
import 'package:flutter_modular/flutter_modular.dart';

class DrawerModule extends Module {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => DrawerCubit(),
        ),
      ];
  @override
  List<ModularRoute> get routes => [];
}
