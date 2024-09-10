// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyCsYQSKfAnyvMMiOBBlQHA96LwbRMi2Mlc',
    appId: '1:357004671079:web:28abd450a2f6ea2962bcc2',
    messagingSenderId: '357004671079',
    projectId: 'apiconsigna',
    authDomain: 'apiconsigna.firebaseapp.com',
    storageBucket: 'apiconsigna.appspot.com',
    measurementId: 'G-Z4PSM4G424',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyD2jICpOAMvc-XjtQD_jpBc9BOV2ckmO_w',
    appId: '1:357004671079:android:71d52851899c2a4b62bcc2',
    messagingSenderId: '357004671079',
    projectId: 'apiconsigna',
    storageBucket: 'apiconsigna.appspot.com',
  );
}