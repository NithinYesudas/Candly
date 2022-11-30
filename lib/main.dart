import 'package:candly/screens/authentication/auth_screen.dart';
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
                //FirebaseAuth.instance.signOut();
                return StreamBuilder(
                  stream: FirebaseAuth.instance.authStateChanges(),
                    builder: (ctx, AsyncSnapshot snapshots){
                  return snapshots.hasData ? const LoadingScreen(): const AuthScreen();
                }) ;
              }
            }));
  }
}
