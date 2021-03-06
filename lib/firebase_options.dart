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
    // ignore: missing_enum_constant_in_switch
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
    }

    throw UnsupportedError(
      'DefaultFirebaseOptions are not supported for this platform.',
    );
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyDvcWFiw793PbB5ANxf7QJ3cGmUx27mPX0',
    appId: '1:699518734440:web:d4ae15d9c4a7f901bd2bdd',
    messagingSenderId: '699518734440',
    projectId: 'banking-996',
    authDomain: 'banking-996.firebaseapp.com',
    storageBucket: 'banking-996.appspot.com',
    measurementId: 'G-SHPX2MEXZE',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA7Kcd7rJ7xUMjlMml7V-PXy8jFkY5_Tw8',
    appId: '1:699518734440:android:ce8862da34177dc1bd2bdd',
    messagingSenderId: '699518734440',
    projectId: 'banking-996',
    storageBucket: 'banking-996.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDkoqopZ8H119AZbKC3v69aBSwF6nxUlwE',
    appId: '1:699518734440:ios:4699a1807f3ad67fbd2bdd',
    messagingSenderId: '699518734440',
    projectId: 'banking-996',
    storageBucket: 'banking-996.appspot.com',
    iosClientId:
        '699518734440-lhdok74n9bd4i0fpsspccbsv6jv8s9bv.apps.googleusercontent.com',
    iosBundleId: 'com.example.banking',
  );
}
