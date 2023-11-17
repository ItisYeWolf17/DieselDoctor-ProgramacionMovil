import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyDHAlxcvMTwmPEn29TC1LYu_QVZWkdhFa0",
            authDomain: "dieseldoctorg2.firebaseapp.com",
            projectId: "dieseldoctorg2",
            storageBucket: "dieseldoctorg2.appspot.com",
            messagingSenderId: "81615932475",
            appId: "1:81615932475:web:7da8f94497497e8aa9e01e",
            measurementId: "G-QJRVZBS5B4"));
  } else {
    await Firebase.initializeApp();
  }
}
