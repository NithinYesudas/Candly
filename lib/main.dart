import 'package:candly/screens/authentication/auth_screen.dart';
import 'package:candly/screens/loading_Screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            backgroundColor: const Color(0xff0C1321),
            cardColor: const Color(0xff1E283C),
            selectedRowColor: const Color(0xff2C3548),
            primaryColorDark: const Color(0xff08217E),
            primaryColor: const Color(0xff415CC0)),
        home: FutureBuilder(
            future: Firebase.initializeApp(),
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoadingScreen();
              } else {
                return const AuthScreen();
              }
            }));
  }
}
