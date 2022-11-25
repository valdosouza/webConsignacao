import 'package:appweb/app/modules/consigna_register/presentation/pages/content_consigna_register.dart';

import 'package:flutter_modular/flutter_modular.dart';

class ConsignaRegisterModule extends Module {
  @override
  List<Bind> get binds => [];
  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const ContentConsignaRegister()),
  ];
}
