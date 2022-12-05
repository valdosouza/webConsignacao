import 'package:appweb/app/modules/Core/core_module.dart';
import 'package:flutter_modular/flutter_modular.dart';

class OrderStockAdjustmentModule extends Module {
  @override
  List<Module> get imports => [
        CoreModule(),
      ];
  @override
  List<Bind> get binds => [];
  @override
  final List<ModularRoute> routes = [];
}
