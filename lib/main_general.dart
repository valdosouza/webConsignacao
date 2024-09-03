import 'package:appweb/app/core/shared/helpers/analytics_engine.dart';
import 'package:appweb/app/core/shared/helpers/crashlytics_engine.dart';
import 'package:flutter/material.dart';

void init() async {
  WidgetsFlutterBinding.ensureInitialized();

  await AnalyticsEngine.init();
  await CrashlyticsEngine.init();
}
