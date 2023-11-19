import 'package:google_fonts/google_fonts.dart';

// class _ForgotPasswordState extends State<ForgotPassword> {
//   final emailtext = TextEditingController();
//   @override
//   void dispose() {
//     emailtext.dispose();
//     super.dispose();
//   }

//   Future<void> passwordReset() async {
//     String email = emailtext.text.trim();
//     if (email.isEmpty || !GetUtils.isEmail(email)) {
//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             content: Text("Please enter a valid email address."),
//           );
//         },
//       );
//       return;
//     }
//     try {
//       var methods = await FirebaseAuth.instance
//           .fetchSignInMethodsForEmail(email.toLowerCase());
//       print("Sign-in methods:$methods");
//       // if (methods.isNotEmpty) {
//       //   await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
//       //   showDialog(
//       //     context: context,
//       //     builder: (context) {
//       //       return AlertDialog(
//       //         content: Text('Password reset email sent to $email'),
//       //       );
//       //     },
//       //   );
//       // }
//       // var userCredential = await FirebaseAuth.instance
//       //     .createUserWithEmailAndPassword(email: email, password: 'Ajk23!2');
//       if (methods.isNotEmpty) {
//         await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
//         showDialog(
//             context: context,
//             builder: (context) {
//               return AlertDialog(
//                 content: Text("Password reset email sent to $email"),
//               );
//             });
//       } else {
//         showDialog(
//           context: context,
//           builder: (context) {
//             return AlertDialog(
//               content: Text('This email is not registered.'),
//             );
//           },
//         );
//       }
//     } on FirebaseAuthException catch (e) {
//       print(e);
//       showDialog(
//         context: context,
//         builder: (context) {
//           return AlertDialog(
//             content: Text(e.message.toString()),
//           );
//         },
//       );
//     }
//     ;
//   }

//   // Future passwordreset() async {
//   //   try {
//   //     var methods = await FirebaseAuth.instance
//   //         .fetchSignInMethodsForEmail(emailtext.text.toLowerCase());
//   //     print("Sign-in methods: $methods");
//   //     if (methods.isNotEmpty) {
//   //       await FirebaseAuth.instance
//   //           .sendPasswordResetEmail(email: emailtext.text.trim());
//   //       showDialog(
//   //           context: context,
//   //           builder: (context) {
//   //             return AlertDialog(
//   //               content: Text(
//   //                   'Password reset email sent to ${emailtext.text.trim()}'),
//   //             );
//   //           });
//   //     } else {
//   //       showDialog(
//   //           context: context,
//   //           builder: (context) {
//   //             return AlertDialog(
//   //               content: Text('This email is not registered.'),
//   //             );
//   //           });
//   //     }
//   //     //   await FirebaseAuth.instance
//   //     //       .sendPasswordResetEmail(email: emailtext.text.trim());
//   //   } on FirebaseAuthException catch (e) {
//   //     print(e);
//   //     showDialog(
//   //         context: context,
//   //         builder: (context) {
//   //           return AlertDialog(
//   //             content: Text(e.message.toString()),
//   //           );
//   //         });
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.transparent,
//           elevation: 0,
//         ),
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 25),
//               child: Text(
//                 'Enter your Email and we will send you a password reset link',
//                 textAlign: TextAlign.center,
//                 style: GoogleFonts.splash(fontSize: 20),
//               ),
//             ),
//             SizedBox(
//               height: 10,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: Container(
//                 margin: const EdgeInsets.all(15),
//                 child: TextField(
//                   keyboardType: TextInputType.name,
//                   controller: emailtext,
//                   style: const TextStyle(color: Colors.black),
//                   decoration: InputDecoration(
//                     fillColor: const Color.fromRGBO(196, 196, 196, 0.2),
//                     filled: true,
//                     hintText: "Enter Your Username",
//                     hintStyle: const TextStyle(color: Colors.grey),
//                     suffixIcon: const Icon(Icons.mail),
//                     focusedBorder: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     enabledBorder: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(10),
//                         borderSide: const BorderSide(color: Colors.white)),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 10),
//             MaterialButton(
//               onPressed: () {
//                 passwordReset();
//               },
//               child: Text('Reset Password'),
//               color: Colors.black,
//             )
//           ],
//         ));
//   }
// }
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _emailController = TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _resetPassword() async {
    try {
      await _auth.sendPasswordResetEmail(email: _emailController.text.trim());
      // Email sent successfully, show a success message or navigate to a confirmation page
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Password Reset'),
            content: Text('Password reset email sent. Check your email inbox.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(
                  'OK',
                  style: TextStyle(color: Color.fromARGB(255, 245, 69, 101)),
                ),
              ),
            ],
          );
        },
      );
    } catch (e) {
      // Handle password reset errors
      print('Password reset failed: $e');
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Error'),
            content: Text('Failed to send reset email. Please try again.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('OK',
                    style: TextStyle(color: Color.fromARGB(255, 245, 69, 101))),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
            padding: const EdgeInsets.only(top: 22), // Adjust padding as needed
            child: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new_rounded,
                color: Colors.black,
              ), // Replace with your icon
              onPressed: () {
                Navigator.of(context).pop();
              },
            )),
        title: Center(
            child: Padding(
                padding: const EdgeInsets.only(top: 24),
                child: Text(
                  'Forgot Password',
                  style: GoogleFonts.inter(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w700),
                ))),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'Enter your Email and we will send you a password reset link',
                textAlign: TextAlign.center,
                style: GoogleFonts.montserrat(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: const EdgeInsets.all(15),
                  child: TextField(
                    controller: _emailController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        fillColor: const Color.fromRGBO(196, 196, 196, 0.2),
                        filled: true,
                        hintText: "Enter Your Email",
                        hintStyle: const TextStyle(color: Colors.grey),
                        suffixIcon: const Icon(Icons.mail),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(color: Colors.white))),
                  ),
                )),
            SizedBox(height: 20),
            ElevatedButton(
              style: ButtonStyle(
                  minimumSize: MaterialStateProperty.all(
                      Size(170, 57)), // Adjust width and height
                  padding: MaterialStateProperty.all(EdgeInsets.all(8)),
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 245, 69, 101))),
              onPressed: _resetPassword,
              child: Text(
                'Reset Password',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
