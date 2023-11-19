// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

import 'package:todoapp/Screens/SplashScreen.dart';
import 'package:todoapp/Screens/WeekTask.dart';
import 'package:todoapp/Screens/about_us.dart';

import 'package:todoapp/Screens/auth_page.dart';

import 'package:todoapp/Screens/createtask.dart';

import 'package:todoapp/Screens/edit_task.dart';
import 'package:todoapp/Screens/forgotpasswordpage.dart';
import 'package:todoapp/Screens/home.dart';
import 'package:todoapp/Screens/login.dart';
import 'package:todoapp/Screens/main_screen.dart';
import 'package:todoapp/Screens/profile.dart';
import 'package:todoapp/Screens/register.dart';
import 'package:todoapp/Screens/task_list.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'main_screen',
      routes: {
        'main_screen': (context) => const Main_Screen(),
        'home': (context) => const Home(),
        'splashscreen': (context) => const SplashScreen(),
        'profile': (context) => const Profile(),
        'login': (context) => Login(
              onTap: () {},
            ),
        'register': (context) => Register(
              onTap: () {},
            ),
        'WeekTask': (context) => const WeekTask(),
        'edit_task': (context) => const Edit_Task(),
        'task_list': (context) => const Task_List(),
        'auth_page': (context) => const AuthPage(),
        'createtask': (context) => const createtask(),
        'forgotpasswordpage': (context) => ForgotPassword(),
        'about_us': (context) => AboutUsPage(),
      },
    );
  }
}
