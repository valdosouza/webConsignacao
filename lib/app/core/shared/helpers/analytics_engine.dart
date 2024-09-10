import 'package:appweb/firebase_options.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';

class AnalyticsEngine {
  static final _instance = FirebaseAnalytics.instance;

  static Future<void> init() async {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    return FirebaseAnalytics.instance.logAppOpen();
  }

  static void logEvent(
      {required String name, required Map<String, Object> parameters}) async {
    await _instance.logEvent(
      name: name,
      parameters: parameters,
    );
  }
}
