// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyDiOGgM1iju8Hk73UfK4jo3bAVM9fmywfU',
    appId: '1:328673010778:web:f0b8d52639ec2db285e463',
    messagingSenderId: '328673010778',
    projectId: 'udemyapp-8be90',
    authDomain: 'udemyapp-8be90.firebaseapp.com',
    storageBucket: 'udemyapp-8be90.firebasestorage.app',
    measurementId: 'G-MQGGWR8ND2',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDAnAF8ZsBkotv84MPg46nolU8Sx6fcvGg',
    appId: '1:328673010778:android:4ccb67d5a81e75b885e463',
    messagingSenderId: '328673010778',
    projectId: 'udemyapp-8be90',
    storageBucket: 'udemyapp-8be90.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAeT4-xhZxUXlqqC6jlF569lQQHzjLvJME',
    appId: '1:328673010778:ios:5d9075b3140e57b385e463',
    messagingSenderId: '328673010778',
    projectId: 'udemyapp-8be90',
    storageBucket: 'udemyapp-8be90.firebasestorage.app',
    iosBundleId: 'com.example.app',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDiOGgM1iju8Hk73UfK4jo3bAVM9fmywfU',
    appId: '1:328673010778:web:6fa3c4b5e87cfa9085e463',
    messagingSenderId: '328673010778',
    projectId: 'udemyapp-8be90',
    authDomain: 'udemyapp-8be90.firebaseapp.com',
    storageBucket: 'udemyapp-8be90.firebasestorage.app',
    measurementId: 'G-TJJNNLBFD5',
  );
}
