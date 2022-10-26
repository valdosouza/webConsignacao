import 'package:appweb/app/modules/splash/presentation/bloc/splash_bloc.dart';
import 'package:appweb/app/modules/splash/presentation/pages/splash_page.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_bloc_bind/modular_bloc_bind.dart';

class SplashModule extends Module {
  @override
  List<Bind> get binds => [
        BlocBind.singleton((i) => SplashBloc()),
      ];
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const SplashPage()),
  ];
}
