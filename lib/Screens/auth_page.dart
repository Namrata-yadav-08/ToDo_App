import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/Screens/login.dart';
import 'package:todoapp/Screens/loginorregister.dart';
import 'package:todoapp/Screens/main_screen.dart';
import 'package:todoapp/Screens/register.dart';

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<User?>(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: ((context, snapshot) {
            if (snapshot.hasData) {
              return Main_Screen();
            } else {
              return LoginOrRegister();
            }
          })),
    );
  }
}
