import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'app/app_module.dart';
import 'app/app_widget.dart';
import 'main_general.dart' as main_general;
import 'main_android.dart' if (dart.library.html) 'main_web.dart'
    as main_platform;

Future<void> main() async {
  main_general.init();
  main_platform.init();
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
