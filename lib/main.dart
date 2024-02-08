import 'dart:io';

import 'package:chat_app1/pages/home.dart';
import 'package:chat_app1/pages/signin.dart';
import 'package:chat_app1/pages/signup.dart';
import 'package:chat_app1/service/auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
              apiKey: "AIzaSyDaAanFCCk3hCq06GOCm2RgQ7-TADJmKhs",
              appId: "1:271164798947:android:950fde7878eeae445312d6",
              messagingSenderId: "271164798947",
              projectId: "chatapp-c6716"),
        )
      : Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: FutureBuilder(
        future: AuthMethods().getCurrentUser(),
        builder: (context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            return Home();
          } else {
            return SignUp();
          }
        },
      ),
    );
  }
}
