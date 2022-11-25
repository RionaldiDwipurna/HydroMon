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
    apiKey: 'AIzaSyB1xRXTuYRXSBlo8rqenCSmc2hJoMfEIko',
    appId: '1:713350924154:web:8a186f35d9503dcfe078c3',
    messagingSenderId: '713350924154',
    projectId: 'hydromon-backend',
    authDomain: 'hydromon-backend.firebaseapp.com',
    databaseURL: 'https://hydromon-backend-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'hydromon-backend.appspot.com',
    measurementId: 'G-PGK0KBGY29',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyC5sUXHZKiEUR9CL6PI54x314pI8AE3BXI',
    appId: '1:713350924154:android:69c444f423ef6646e078c3',
    messagingSenderId: '713350924154',
    projectId: 'hydromon-backend',
    databaseURL: 'https://hydromon-backend-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'hydromon-backend.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyB1cXr7iBJ59UwIAzIDqXQIPhY1HBsOfiU',
    appId: '1:713350924154:ios:d0bebae4c1fd801fe078c3',
    messagingSenderId: '713350924154',
    projectId: 'hydromon-backend',
    databaseURL: 'https://hydromon-backend-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'hydromon-backend.appspot.com',
    iosClientId: '713350924154-94a7na3c1grgg47hpco7l1na8pcpqnap.apps.googleusercontent.com',
    iosBundleId: 'com.example.hydromon',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyB1cXr7iBJ59UwIAzIDqXQIPhY1HBsOfiU',
    appId: '1:713350924154:ios:d0bebae4c1fd801fe078c3',
    messagingSenderId: '713350924154',
    projectId: 'hydromon-backend',
    databaseURL: 'https://hydromon-backend-default-rtdb.asia-southeast1.firebasedatabase.app',
    storageBucket: 'hydromon-backend.appspot.com',
    iosClientId: '713350924154-94a7na3c1grgg47hpco7l1na8pcpqnap.apps.googleusercontent.com',
    iosBundleId: 'com.example.hydromon',
  );
}
