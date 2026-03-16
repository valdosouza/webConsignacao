import 'package:appweb/firebase_options.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class AnalyticsEngine {
  static final _instance = FirebaseAnalytics.instance;

  static Future<void> init() async {
    if (Firebase.apps.isEmpty) {
      try {
        if (kIsWeb) {
          await Firebase.initializeApp(
            options: DefaultFirebaseOptions.currentPlatform,
          );
        } else {
          await Firebase.initializeApp();
        }
      } on FirebaseException catch (e) {
        if (e.code != 'duplicate-app') rethrow;
      } on Exception catch (e) {
        if (!e.toString().contains('duplicate-app')) rethrow;
      }
    }
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
