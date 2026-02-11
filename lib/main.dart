import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/auth/RegisterScreeb.dart';
import 'package:notes_app/auth/loginScreen.dart';
import 'package:notes_app/homepage.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  void initState() {
    FirebaseAuth.instance
  .authStateChanges()
  .listen((User? user) {
    if (user == null) {
      print('user is currently signed out');
    } else {
      print('user is signed in');
    }
  });

   
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Loginscreen() ,
      routes: {"Register": (context) => const Registerscreeb(),
      "Login": (context) => const Loginscreen(),
      "Home": (context) => const Homepage()
      },
    );
  }
}

