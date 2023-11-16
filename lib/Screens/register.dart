import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todoapp/Screens/login.dart';
import 'package:todoapp/widgets/text.dart';

class Register extends StatefulWidget {
  const Register({
    super.key,
    required void Function() onTap,
  });

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  var emailtext = TextEditingController();
  var password = TextEditingController();
  var confirmpass = TextEditingController();
  // bool showLogin = true;
  // void togglePages() {
  //   setState(() {
  //     showLogin = !showLogin;
  //   });
  // }
  void usersignup() async {
    showDialog(
      context: context,
      builder: (context) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
    try {
      if (password.text == confirmpass.text) {
        await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: emailtext.text,
          password: password.text,
        );
        showdialog(context);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => Login(
                      onTap: () {},
                    )));
        Navigator.of(context).pop();
      } else {
        Navigator.pop(context);
        showErrorMessage("Password doesn't match");
      }

      //     );
      //   } else {
      //     showErrorMessage("Password doesn't match");
      //   }
      //   Navigator.pop(context);
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      showErrorMessage(e.code);
    }
  }

  void showErrorMessage(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color.fromARGB(255, 245, 240, 255),
          title: Center(
              child: Text(message,
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      color: Color.fromARGB(255, 104, 29, 255),
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ))),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // if (showLogin = true) {
    //   return Login();
    // }
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(children: [
        Container(
          // margin: EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const SizedBox(
                height: 20,
              ),
              _header(context),
              // const SizedBox(
              //   height: 20,
              // ),
              _inputField(context),
              // const SizedBox(
              //   height: 10,
              // ),
              // _forgotPassword(context),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Expanded(
                        child: Divider(
                      thickness: 1,
                      color: Colors.grey,
                    )),
                    Text('or', style: TextStyle(color: Colors.grey)),
                    Expanded(
                        child: Divider(
                      thickness: 1,
                      color: Colors.grey,
                    ))
                  ],
                ),
              ),
              // const Text(
              //   "___________________________or_____________________________",
              //   style: TextStyle(color: Colors.grey),
              // ),
              // const SizedBox(
              //   height: 5,
              // ),
              outlinebuttn(context),

              // const SizedBox(
              //   height: 20,
              // ),
            ],
          ),
        ),
      ]),
    );
  }

  void showdialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("You are registered"),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Login(
                                  onTap: () {},
                                )));
                    // Navigator.of(context).pop();
                  },
                  child: const Text("OK")),
            ],
          );
        });
  }

  _header(context) {
    return const Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Positioned(child: ),
        CustomText(
          text: "Register",
          fontStyle: null,
          color: Colors.black,
          fontSize: 40,
          fontweigth: FontWeight.bold,
        )
      ],
    );
  }

  _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: const Text(
            "Username",
            style: TextStyle(color: Colors.black),
          ),
        ),
        // Padding(padding: EdgeInsets.all(19)),
        Container(
          margin: const EdgeInsets.all(15),
          child: TextField(
            keyboardType: TextInputType.name,
            controller: emailtext,
            // enabled: false,

            style: const TextStyle(color: Colors.black),

            decoration: InputDecoration(
              fillColor: Color.fromRGBO(196, 196, 196, 0.2),
              filled: true,
              hintText: "Enter Your Username",
              hintStyle: const TextStyle(color: Colors.grey),
              // fillColor: Color.fromRGBO(151, 151, 151, 1),
              // filled: true,
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
          margin: const EdgeInsets.only(left: 20),
          child: const Text(
            "Password",
            style: TextStyle(color: Colors.black),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(15),
          child: TextField(
            controller: password,
            obscureText: true,
            // enabled: false,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
                fillColor: Color.fromRGBO(196, 196, 196, 0.2),
                filled: true,
                hintText: "Password",
                hintStyle: const TextStyle(color: Colors.grey),
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
        Container(
          margin: const EdgeInsets.only(left: 20),
          child: const Text(
            "Confirm Password",
            style: TextStyle(color: Colors.black),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(15),
          child: TextField(
            controller: confirmpass,
            obscureText: true,
            // enabled: false,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
                fillColor: Color.fromRGBO(196, 196, 196, 0.2),
                filled: true,
                hintText: "Confirm Password",
                hintStyle: const TextStyle(color: Colors.grey),
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
              // showdialog(context);
              usersignup();

              // print(uname);
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //         builder: (context) => Login(
              //               onTap: () {},
              //             )));
              // Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              // shape: const StadiumBorder(),
              shape: const ContinuousRectangleBorder(),
              backgroundColor: const Color.fromARGB(255, 255, 100, 125),

              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: const Text(
              "Register",
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }

  _signup(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Don’t have an account?",
          style: TextStyle(color: Colors.grey),
        ),
        TextButton(onPressed: () {}, child: const Text("Register"))
      ],
    );
  }

  outlinebuttn(context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.all(19), // Adjust margin as needed
          // padding: EdgeInsets.all(10),
          // padding: EdgeInsets.all(90),
          width: 400, height: 70,
          child: OutlinedButton(
            onPressed: () {},
            style: ButtonStyle(
              shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                // side: BorderSide(color: Colors.blue)
              )),
              side: MaterialStateProperty.all<BorderSide>(
                const BorderSide(color: Colors.blue),
              ),
            ),
            child: const Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(padding: EdgeInsets.all(30)),
                Icon(
                  FontAwesomeIcons.google,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "Continue With Google",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        Container(
          margin: const EdgeInsets.all(19), // Adjust margin as needed
          // padding: EdgeInsets.all(10),
          // padding: EdgeInsets.all(90),
          width: 400, height: 70,
          child: OutlinedButton(
            onPressed: () {},
            style: ButtonStyle(
              shape: MaterialStatePropertyAll<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
                // side: BorderSide(color: Colors.blue)
              )),
              side: MaterialStateProperty.all<BorderSide>(
                const BorderSide(color: Colors.blue),
              ),
            ),
            child: const Row(
              // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(padding: EdgeInsets.all(30)),
                Icon(
                  FontAwesomeIcons.appStoreIos,
                  color: Colors.red,
                ),
                SizedBox(
                  width: 30,
                ),
                Text(
                  "Continue With Apple",
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
