import 'package:flutter/material.dart';
import 'package:todoapp/Screens/WeekTask.dart';
import 'package:todoapp/Screens/focus.dart';
import 'package:todoapp/Screens/home.dart';
import 'package:todoapp/Screens/login.dart';
import 'package:todoapp/Screens/main_screen.dart';
import 'package:todoapp/Screens/new_task.dart';
import 'package:todoapp/Screens/profile.dart';
import 'package:todoapp/Screens/register.dart';
import 'package:todoapp/widgets/const.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      //   useMaterial3: true,
      // ),
      initialRoute: 'login',
      routes: {
        'main_screen': (context) => const Main_Screen(),
        'home': (context) => const Home(),
        'profile': (context) => const Profile(),
        'login': (context) => const Login(),
        'register': (context) => const Register(),
        'WeekTask': (context) => const WeekTask(),
        'focus': (context) => const InFocus(),
        'new_task': (context) => const New_Task(),
      },
      // home: WeekTask(),
      // home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: const Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             // ElevatedButton(onPressed: (){}, child: Text("jnf"))
//             // FloatingActionButton(
//             //   onPressed: () {
//             //     print("vh");
//             //   },
//             //   child: Text("hjf"),
//             // )
//           ],
//         ),
//       ),
//     );
//   }
// }
