import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyDXPpYzihHh4mAhFK0qC892-dqMsQTyDvM", 
      appId: "1:1095896263754:web:f8a17b3e4daa9dcf938ab3", 
      messagingSenderId: "1095896263754", 
      projectId: "feldy-78d50",
      authDomain: "feldy-78d50.firebaseapp.com",
      storageBucket: "feldy-78d50.appspot.com",
    )
  );
  runApp(const MyApp());
}