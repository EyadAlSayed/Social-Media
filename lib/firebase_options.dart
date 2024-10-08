import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;
/**
 * Created by Eng.Eyad AlSayed on 10/7/2024.
 */

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

      // TODO uncomment TargetPlatform.iOS and add IOS config
      // case TargetPlatform.iOS:
      //   return ios;

      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBmd0DX_Iu9OQBY-q9ktcz7yb_gOrBMCKo',
    appId: '1:1058046215614:android:d72b46d474d8b63352e5ef',
    messagingSenderId: '1058046215614',
    projectId: 'test-project-a6080',
    storageBucket: 'test-project-a6080.appspot.com',
  );

// static const FirebaseOptions ios = FirebaseOptions(
//   apiKey: '',
//   appId: '',
//   messagingSenderId: '',
//   projectId: '',
//   storageBucket: '',
//   iosBundleId: '',
// );
}
