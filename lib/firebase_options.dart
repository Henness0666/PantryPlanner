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
/// 

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
        return macos;
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
    apiKey: 'AIzaSyDNQYZfoQ74-kB1P1DD_iQV0exCcbzc2WU',
    appId: '1:176562682480:web:6b66d09271ac6078d212b5',
    messagingSenderId: '176562682480',
    projectId: 'stuff-f365d',
    authDomain: 'stuff-f365d.firebaseapp.com',
    storageBucket: 'stuff-f365d.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBcp3pgw8sSkEtgU9s8SNwbj3Gdb9Ui6o0',
    appId: '1:176562682480:android:d580f9a8065790c9d212b5',
    messagingSenderId: '176562682480',
    projectId: 'stuff-f365d',
    storageBucket: 'stuff-f365d.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDsKRHOmuOIk-br3cVYBGIaDfdtiTRMUc8',
    appId: '1:176562682480:ios:06c10a173b9c13d0d212b5',
    messagingSenderId: '176562682480',
    projectId: 'stuff-f365d',
    storageBucket: 'stuff-f365d.appspot.com',
    iosClientId: '176562682480-hqdvkkib8s8tfm9e52g1mrsp6s4pd9tp.apps.googleusercontent.com',
    iosBundleId: 'com.example.pantryApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDsKRHOmuOIk-br3cVYBGIaDfdtiTRMUc8',
    appId: '1:176562682480:ios:e1592b8107f41d88d212b5',
    messagingSenderId: '176562682480',
    projectId: 'stuff-f365d',
    storageBucket: 'stuff-f365d.appspot.com',
    iosClientId: '176562682480-n7sq3ag28c4b5unofd0i3q1sst2lcc1a.apps.googleusercontent.com',
    iosBundleId: 'com.example.pantryApp.RunnerTests',
  );
}
