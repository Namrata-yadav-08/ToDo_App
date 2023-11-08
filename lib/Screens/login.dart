import 'dart:ui';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:todoapp/Screens/register.dart';
import 'package:todoapp/widgets/const.dart';
import 'package:todoapp/widgets/text.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var emailtext = TextEditingController();
  var password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      body: ListView(children: [
        Container(
          // margin: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Padding(padding: EdgeInsets.only(top: 10)),
              buildcircl(context),
              _header(context),
              _inputField(context),
              Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                _forgotPassword(context),
              ]),
              textline(),
              textcontinue(),
              buildiconbutton(context),
              register(),
            ],
          ),
        ),
      ]),
    );
  }

  Widget buildiconbutton(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        iconButton(
            context, const Icon(FontAwesomeIcons.google), () {}, Colors.red),
        iconButton(
            context, const Icon(FontAwesomeIcons.apple), () {}, Colors.black),
      ],
    );
  }

  Widget iconButton(
      BuildContext context, Icon icon, VoidCallback onPressed, Color color) {
    return IconButton(
      icon: icon,
      onPressed: onPressed,
      iconSize: 30,
      color: color,
    );
  }

  CustomText textcontinue() {
    return const CustomText(
      text: "continue with",
      fontStyle: null,
      color: Colors.black,
      fontSize: 15,
    );
  }

  CustomText textline() {
    return const CustomText(
      text: "__________________________or______________________________",
      color: Colors.grey,
      fontSize: 15,
      fontStyle: null,
    );
    // CustomText(text: "Continue with", fontStyle: fontStyle, color: color)
  }

  Row register() {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomText(
          text: "Don't have account?",
          // fontsize: 100,
          fontSize: 15,
          color: Colors.black,
          fontStyle: FontStyle.normal,
        ),
        Const()
      ],
    );
  }

  _header(context) {
    return const Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        CustomText(
          text: "Welcome Back",
          fontStyle: null,
          color: Colors.black,
          fontweigth: FontWeight.bold,
          fontSize: 40,
        ),
        CustomText(
          text: "sign in to access your account",
          fontStyle: null,
          color: Colors.black,
          fontSize: 15,
        )
      ],
    );
  }

  _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: const EdgeInsets.all(15),
          child: TextField(
            keyboardType: TextInputType.name,
            controller: emailtext,
            // enabled: false,

            style: const TextStyle(color: Colors.black),

            decoration: InputDecoration(
              fillColor: const Color.fromRGBO(196, 196, 196, 0.2),
              filled: true,
              hintText: "Enter Your Username",
              hintStyle: const TextStyle(color: Colors.grey),
              suffixIcon: const Icon(Icons.mail),

              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),

                // borderSide: const BorderSide(color: Colors.blue),
              ),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white))
              // disabledBorder: OutlineInputBorder()
              ,
              // suffixText: "hbchjdbch",

              // suffixStyle: TextStyle(color: Colors.indigo)
            ),
          ),
        ),
        // const SizedBox(height: 10),

        Container(
          margin: const EdgeInsets.all(15),
          child: TextField(
            controller: password,
            obscureText: true,
            obscuringCharacter: '*',
            // enabled: false,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
                fillColor: const Color.fromRGBO(196, 196, 196, 0.2),
                filled: true,
                hintText: "Password",
                hintStyle: const TextStyle(color: Colors.grey),
                suffixIcon: const Icon(Icons.lock),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  // borderSide: const BorderSide(color: Colors.blue),
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(color: Colors.white))
                // disabledBorder: OutlineInputBorder()
                ,
                // suffixText: "hbchjdbch",

                suffixStyle: const TextStyle(color: Colors.indigo)),
          ),
        ),
        // const SizedBox(height: 10),
        Container(
          margin: const EdgeInsets.all(15),
          child: ElevatedButton(
            onPressed: () {
              String uname = emailtext.text.toString();
              String passwrd = password.text.toString();
              // print(uname);
              Navigator.pushNamed(context, 'main_screen');
            },
            style: ElevatedButton.styleFrom(
              // shape: const StadiumBorder(),
              shape: const ContinuousRectangleBorder(),
              backgroundColor: const Color.fromRGBO(134, 135, 231, 0.5),

              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text(
              "Login",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ),
        )
      ],
    );
  }

  _forgotPassword(context) {
    return TextButton(
        onPressed: () {},
        child: const CustomText(
          text: "Forget Password ?",
          fontStyle: null,
          color: Colors.red,
          fontSize: 15,
        ));
  }

  // _signup(context) {
  //   return Row(
  //     mainAxisAlignment: MainAxisAlignment.center,
  //     children: [
  //       const Text(
  //         "Don’t have an account?",
  //         style: TextStyle(color: Colors.grey),
  //       ),
  //       TextButton(
  //           onPressed: () {
  //             Navigator.push(
  //                 context, MaterialPageRoute(builder: (context) => Register()));
  //           },
  //           child: const Text("Register"))
  //     ],
  //   );
  // }

  // outlinebuttn(context) {
  //   return Column(
  //     children: [
  //       Container(
  //         margin: const EdgeInsets.all(19), // Adjust margin as needed
  //         // padding: EdgeInsets.all(10),
  //         // padding: EdgeInsets.all(90),
  //         width: 400, height: 70,
  //         child: OutlinedButton(
  //           onPressed: () {},
  //           style: ButtonStyle(
  //             shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
  //                 RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(10),
  //               // side: BorderSide(color: Colors.blue)
  //             )),
  //             side: MaterialStateProperty.all<BorderSide>(
  //               const BorderSide(color: Colors.blue),
  //             ),
  //           ),
  //           child: const Row(
  //             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //             children: [
  //               Padding(padding: EdgeInsets.all(30)),
  //               Icon(
  //                 FontAwesomeIcons.google,
  //                 // color: Colors.red,
  //               ),
  //               SizedBox(
  //                 width: 30,
  //               ),
  //               Text(
  //                 "Continue With Google",
  //                 style: TextStyle(color: Colors.black),
  //               ),
  //             ],
  //           ),
  //         ),
  //       ),
  //       Container(
  //         margin: const EdgeInsets.all(19), // Adjust margin as needed
  //         // padding: EdgeInsets.all(10),
  //         // padding: EdgeInsets.all(90),
  //         width: 400, height: 70,
  //         child: OutlinedButton(
  //           onPressed: () {},
  //           style: ButtonStyle(
  //             shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
  //                 RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(10),
  //               // side: BorderSide(color: Colors.blue)
  //             )),
  //             side: MaterialStateProperty.all<BorderSide>(
  //               const BorderSide(color: Colors.blue),
  //             ),
  //           ),
  //           child: const Row(
  //             // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //             children: [
  //               Padding(padding: EdgeInsets.all(30)),
  //               Icon(
  //                 FontAwesomeIcons.appStore,
  //                 color: Colors.red,
  //               ),
  //               SizedBox(
  //                 width: 30,
  //               ),
  //               Text(
  //                 "Continue With Apple",
  //                 style: TextStyle(color: Colors.white),
  //               ),
  //             ],
  //           ),
  //         ),
  //       )
  //     ],
  //   );
  // }
  Widget buildcircl(BuildContext context) {
    return const CircleAvatar(
      radius: 70,
    );
  }
}
