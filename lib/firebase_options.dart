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
    apiKey: 'AIzaSyBuXHG7J2mKYPu6-UnVd9aT1lHwxUdNxAM',
    appId: '1:20073290389:web:d4c22efc0cf49e57fb599c',
    messagingSenderId: '20073290389',
    projectId: 'udemy-course-6a389',
    authDomain: 'udemy-course-6a389.firebaseapp.com',
    storageBucket: 'udemy-course-6a389.appspot.com',
    measurementId: 'G-5JGR5ZXF9F',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyApJ94RJmnCJJ-fcQZtp8XTLboWDRFUBoc',
    appId: '1:20073290389:android:52b2d79d0c60ca62fb599c',
    messagingSenderId: '20073290389',
    projectId: 'udemy-course-6a389',
    storageBucket: 'udemy-course-6a389.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyD4HwTjjafR5x58Figk3HaoJwRjy0uBhQ8',
    appId: '1:20073290389:ios:a4eba270cb7974a8fb599c',
    messagingSenderId: '20073290389',
    projectId: 'udemy-course-6a389',
    storageBucket: 'udemy-course-6a389.appspot.com',
    androidClientId: '20073290389-pckm0jpsjdd4heemm8539pa02im33i0s.apps.googleusercontent.com',
    iosClientId: '20073290389-t01ou9mudl9ll43t58jbv88kh9780a12.apps.googleusercontent.com',
    iosBundleId: 'com.example.project1',
  );
}