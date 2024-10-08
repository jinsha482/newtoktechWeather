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
    apiKey: 'AIzaSyCnJPwqoulfD69amvs1ipArT-fRmAeXJLA',
    appId: '1:523527128157:web:a68df0b570cab635ea79b4',
    messagingSenderId: '523527128157',
    projectId: 'weatherapp-6aae8',
    authDomain: 'weatherapp-6aae8.firebaseapp.com',
    storageBucket: 'weatherapp-6aae8.appspot.com',
    measurementId: 'G-E2G560CVNM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBacRhxyzeatle7OD6YTQkqUjS-4vDj6aI',
    appId: '1:523527128157:android:5b9a46fdea0e12caea79b4',
    messagingSenderId: '523527128157',
    projectId: 'weatherapp-6aae8',
    storageBucket: 'weatherapp-6aae8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCX347_A7K7b_81gTNRHMl3kMx9asfJY8I',
    appId: '1:523527128157:ios:3aa482ce299c4f35ea79b4',
    messagingSenderId: '523527128157',
    projectId: 'weatherapp-6aae8',
    storageBucket: 'weatherapp-6aae8.appspot.com',
    iosBundleId: 'com.example.newtoktechassignment',
  );
}
