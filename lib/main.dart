import 'package:flutter/material.dart';
import 'package:todoapp/Screens/WeekTask.dart';
import 'package:todoapp/Screens/edit_task.dart';
import 'package:todoapp/Screens/focus.dart';
import 'package:todoapp/Screens/home.dart';
import 'package:todoapp/Screens/login.dart';
import 'package:todoapp/Screens/main_screen.dart';
import 'package:todoapp/Screens/new_task.dart';
import 'package:todoapp/Screens/profile.dart';
import 'package:todoapp/Screens/register.dart';
import 'package:todoapp/Screens/task_list.dart';
import 'package:todoapp/widgets/const.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: 'edit_task',
      routes: {
        'main_screen': (context) => const Main_Screen(),
        'home': (context) => const Home(),
        'profile': (context) => const Profile(),
        'login': (context) => const Login(),
        'register': (context) => const Register(),
        'WeekTask': (context) => const WeekTask(),
        'focus': (context) => const InFocus(),
        'new_task': (context) => const New_Task(),
        'edit_task': (context) => const Edit_Task(),
        'task_list': (context) => const Task_List()
      },
    );
  }
}
