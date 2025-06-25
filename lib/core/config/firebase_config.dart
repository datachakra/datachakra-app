import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

class FirebaseConfig {
  // 🔥 REPLACE THESE WITH YOUR ACTUAL FIREBASE VALUES FROM STEP 2
  static const String projectId = 'datachakra-app';
  static const String appId = '1:928028959885:web:a1b53f4c952ba6eb3d2ec4';
  static const String messagingSenderId = '928028959885';
  static const String apiKey = 'AIzaSyCAIBf7fFMzxQkMI5KWWfkuFjV3FBH1tvQ';
  static const String authDomain = 'datachakra-app.firebaseapp.com';
  static const String storageBucket = 'datachakra-app.firebasestorage.app';
  static const String measurementId = 'G-LC8N69WPE3';

  // Web configuration
  static const FirebaseOptions web = FirebaseOptions(
    apiKey: apiKey,
    appId: appId,
    messagingSenderId: messagingSenderId,
    projectId: projectId,
    authDomain: authDomain,
    storageBucket: storageBucket,
    measurementId: measurementId,
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
