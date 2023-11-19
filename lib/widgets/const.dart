import 'package:flutter/material.dart';
import 'package:todoapp/Screens/register.dart';
import 'package:todoapp/widgets/text.dart';

class Const extends StatelessWidget {
  const Const({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Register(
                        onTap: () {},
                      )));
        },
        child: const Text(
          "Register",
          style: TextStyle(color: Color.fromARGB(255, 245, 69, 101)),
        ));
  }
}
