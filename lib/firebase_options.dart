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
    apiKey: 'AIzaSyA8jEEvBRqoM2NwKINLHgsEomn0jClpfQE',
    appId: '1:256070925050:web:809c3807f170ce1366a743',
    messagingSenderId: '256070925050',
    projectId: 'burtseva-flutter-lab-d4da8',
    authDomain: 'burtseva-flutter-lab-d4da8.firebaseapp.com',
    storageBucket: 'burtseva-flutter-lab-d4da8.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyA3sv7-Oi51i1UwoeD3QtuQxlfsr_DaEGs',
    appId: '1:256070925050:android:d5fe0d5fa739bb7666a743',
    messagingSenderId: '256070925050',
    projectId: 'burtseva-flutter-lab-d4da8',
    storageBucket: 'burtseva-flutter-lab-d4da8.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDdg7P54iVe5Yo-IXH5WFy94sWT0ipI7Q8',
    appId: '1:256070925050:ios:40d5d5b19d446e7166a743',
    messagingSenderId: '256070925050',
    projectId: 'burtseva-flutter-lab-d4da8',
    storageBucket: 'burtseva-flutter-lab-d4da8.appspot.com',
    iosBundleId: 'com.example.burtsevaFlutterLab',
  );
}
