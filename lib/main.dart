import 'package:candly/screens/auth_screen.dart';
import 'package:candly/screens/homepage.dart';
import 'package:candly/screens/loading_Screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: FutureBuilder(
            future: Firebase.initializeApp(),
            builder: (ctx, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const LoadingScreen();
              } else {
                return StreamBuilder(
                    stream: FirebaseAuth.instance.authStateChanges(),
                    builder: (ctx, AsyncSnapshot snapshots) {
                      if (snapshots.connectionState ==
                          ConnectionState.waiting) {
                        return const LoadingScreen();
                      }
                      return snapshots.hasData
                          ? const HomeScreen()
                          : const AuthScreen();
                    });
              }
            }));
  }
}
