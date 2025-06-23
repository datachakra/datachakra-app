import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class FirebaseConfig {
  static const String projectId = 'datachakra-app';
  static const String appId = '1:YOUR_PROJECT_NUMBER:web:YOUR_WEB_APP_ID';
  static const String messagingSenderId = 'YOUR_MESSAGING_SENDER_ID';
  static const String apiKey = 'YOUR_API_KEY';
  
  // Web configuration
  static const FirebaseOptions web = FirebaseOptions(
    apiKey: apiKey,
    appId: appId,
    messagingSenderId: messagingSenderId,
    projectId: projectId,
    authDomain: '$projectId.firebaseapp.com',
    storageBucket: '$projectId.appspot.com',
    measurementId: 'G-YOUR_MEASUREMENT_ID',
  );

  // iOS configuration
  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'YOUR_IOS_API_KEY',
    appId: 'YOUR_IOS_APP_ID',
    messagingSenderId: messagingSenderId,
    projectId: projectId,
    storageBucket: '$projectId.appspot.com',
    iosBundleId: 'com.datachakra.app',
  );

  // Android configuration
  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'YOUR_ANDROID_API_KEY',
    appId: 'YOUR_ANDROID_APP_ID',
    messagingSenderId: messagingSenderId,
    projectId: projectId,
    storageBucket: '$projectId.appspot.com',
  );

  // Initialize Firebase for current platform
  static Future<void> initialize() async {
    await Firebase.initializeApp(
      options: defaultTargetPlatform == TargetPlatform.iOS
          ? ios
          : defaultTargetPlatform == TargetPlatform.android
              ? android
              : web,
    );
  }

  // Get platform-specific options
  static FirebaseOptions get currentPlatform {
    switch (defaultTargetPlatform) {
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.android:
        return android;
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
      case TargetPlatform.linux:
      default:
        return web;
    }
  }
}