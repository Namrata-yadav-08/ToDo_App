import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 244, 244, 244),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: const Column(
                    children: [
                      Text(
                        'Profile',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10)),
                      CircleAvatar(
                        radius: 24,
                      ),
                      Text('User'),
                    ],
                  ),
                ),
              ),
              const Padding(padding: EdgeInsets.all(10)),
              Row(
                children: [
                  Container(
                    height: 30,
                    color: Colors.white,
                  ),
                  Container(),
                ],
              ),
              // Text('settings'),
              // Container(
              //   width: 90,
              //   height: 30,
              //   color: Colors.white,
              // ),
              // Container(
              //   width: 90,
              //   height: 30,
              //   color: Colors.white,
              // ),
              // Container(
              //   width: 90,
              //   height: 30,
              //   color: Colors.white,
              // ),
              // Text('settings'),
              // Container(
              //   width: 90,
              //   height: 30,
              //   color: Colors.white,
              // ),
              // Container(
              //   width: _width * 0.90,
              //   height: 30,
              //   color: Colors.white,
              // ),
              Padding(
                padding: const EdgeInsets.only(left: 24),
                child: Text(
                  'Account',
                  textAlign: TextAlign.start,
                  style: GoogleFonts.inter(
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(178, 0, 0, 0)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                color: const Color.fromARGB(255, 252, 252, 254),
                width: _width * 0.90,
                height: 48,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.verified_user,
                        size: 20,
                        color: Color.fromARGB(255, 255, 100, 125),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Change Name",
                        style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 174),
                        child: IconButton(
                            onPressed: () async {
                              // await user?.updateDisplayName("Jane Q. User");
                            },
                            icon: Icon(
                              Icons.arrow_forward_ios_rounded,
                            )),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                color: const Color.fromARGB(255, 252, 252, 254),
                width: _width * 0.90,
                height: 48,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.key,
                        size: 20,
                        color: Color.fromARGB(255, 255, 100, 125),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Change Password",
                        style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 146),
                        child: IconButton(
                            onPressed: () async {
                              // await user?.updatePassword(newPassword);
                            },
                            icon: Icon(
                              Icons.arrow_forward_ios_rounded,
                            )),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                color: const Color.fromARGB(255, 252, 252, 254),
                width: _width * 0.90,
                height: 48,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.person_rounded,
                        size: 20,
                        color: Color.fromARGB(255, 255, 100, 125),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Change Profile Picture",
                        style: GoogleFonts.inter(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 115),
                        child: IconButton(
                            onPressed: () async {
                              // await user?.updatePhotoURL("https://example.com/jane-q-user/profile.jpg");
                            },
                            icon: Icon(
                              Icons.arrow_forward_ios_rounded,
                            )),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                color: const Color.fromARGB(255, 252, 252, 254),
                width: _width * 0.90,
                height: 48,
                // decoration: BoxDecoration(
                //     color: const Color.fromARGB(255, 252, 252, 254),
                //     borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.logout,
                        size: 20,
                        color: Color.fromARGB(255, 255, 100, 125),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      TextButton(
                        onPressed: () async {
                          await FirebaseAuth.instance.signOut();
                        },
                        child: Text(
                          "LOGOUT",
                          style: GoogleFonts.inter(
                              color: const Color.fromARGB(255, 255, 100, 125),
                              fontSize: 15,
                              fontWeight: FontWeight.w500),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }
}
