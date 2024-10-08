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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAAQPxNpNiWxdJIg318-H3a4bUZtf0gZlw',
    appId: '1:427296167611:android:a921f8bf13a0b729bfbb9e',
    messagingSenderId: '427296167611',
    projectId: 'loogisti-38a9e',
    storageBucket: 'loogisti-38a9e.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyAE62FYbfIFt9A06pkMBDuS3icuv-e3q8U',
    appId: '1:427296167611:ios:fc0d37dc005a48b7bfbb9e',
    messagingSenderId: '427296167611',
    projectId: 'loogisti-38a9e',
    storageBucket: 'loogisti-38a9e.appspot.com',
    androidClientId: '427296167611-a9vv7j6etkpspa84nnl82cuvrqoo48qk.apps.googleusercontent.com',
    iosClientId: '427296167611-19iqmq91l00j47l9lkmijo039ua1pb3l.apps.googleusercontent.com',
    iosBundleId: 'com.loogisti.logisticMobileDriver',
  );

}