import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyA-wB_KDNtPzDQhNAFu5jbbU5WcB_LYmQQ",
            authDomain: "fest-ho0e3d.firebaseapp.com",
            projectId: "fest-ho0e3d",
            storageBucket: "fest-ho0e3d.appspot.com",
            messagingSenderId: "707124892405",
            appId: "1:707124892405:web:459fdf2726ec461d1babbc"));
  } else {
    await Firebase.initializeApp();
  }
}
