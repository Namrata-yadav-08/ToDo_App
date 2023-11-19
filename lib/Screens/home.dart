// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/Screens/createtask.dart';
import 'package:todoapp/Screens/profile.dart';
import 'package:todoapp/widgets/todocontainer.dart';
// import 'package:todoapp/widgets/todocontainer.dart';
import 'package:todoapp/widgets/todolist.dart';
import 'package:flutter/services.dart';
import 'user_controller.dart';

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  User? user;
  String? globalUserImage;

  @override
  void initState() {
    super.initState();
    globalUserImage = userController.userImage.value;
    // Fetch the currently logged-in user
    getUser();
  }

  Future<void> getUser() async {
    User? currentUser = FirebaseAuth.instance.currentUser;
    if (currentUser != null) {
      setState(() {
        user = currentUser;
      });
      // You can access user.email, user.displayName, user.photoURL, etc.
    }
  }

  // void navigateToProfilePage() async {
  //   final updatedUserImage = await Navigator.push(
  //       context, MaterialPageRoute(builder: (context) => Profile()));
  //   if (updatedUserImage != null) {
  //     setState(() {
  //       globalUserImage = updatedUserImage;
  //     });
  //   }
  // }

  void edittask(index) async {
    // Navigate to the AddTaskScreen and wait for a result
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => createtask()),
    );

    // Check if the result is not null (user added a task)
    if (result != null) {
      setState(() {
        // Add the edited task to the list
        todolist[index] = result;
      });
      // Now delete the old task
      deleteTask(index);
    }
  }

  void checkBoxChanged(bool? value, int index) {
    setState(() {
      todolist[index]["complete"] = value ?? false;
    });
  }

  void deleteTask(int index) {
    setState(() {
      todolist.removeAt(index);
    });
    // updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    final currentDate = DateTime.now();
    final formattedDate = DateFormat('MMM dd, y').format(currentDate);
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 244, 244, 244),
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 77,
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 244, 244, 244),
          title: Padding(
            padding: const EdgeInsets.fromLTRB(11, 20, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hey ${user?.displayName ?? 'User'}',
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 6,
                ),
                Text(
                  '$formattedDate',
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(255, 164, 164, 164),
                  ),
                ),
              ],
            ),
          ),
          actions: [
            Padding(
              padding: EdgeInsets.fromLTRB(0, 28, 26, 0),
              child: CircleAvatar(
                backgroundImage:
                    globalUserImage != null && globalUserImage!.isNotEmpty
                        ? FileImage(
                            File(globalUserImage!)) // User's image if available
                        : AssetImage('assets/images/Group 171 (2).png')
                            as ImageProvider<Object>,
                radius: 24,
              ),
            )
          ],
        ),
        body: ListView(children: [
          Padding(padding: EdgeInsets.only(right: 90)),
          Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align children to the left
            children: [
              Row(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 28),
                  child: Text(
                    "Category",
                    style: GoogleFonts.montserrat(
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                TextButton.icon(
                    onPressed: () {},
                    icon: Text("View all",
                        style: GoogleFonts.inter(
                            textStyle: const TextStyle(
                          color: Color.fromARGB(127, 0, 0, 0),
                          fontSize: 10,
                          fontWeight: FontWeight.w700,
                        ))),
                    label: Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Color.fromARGB(127, 0, 0, 0),
                      size: 10,
                    ))
              ]),

              Padding(
                padding: const EdgeInsets.fromLTRB(13, 12, 0, 0),
                child: Container(
                  height: 150,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color.fromARGB(255, 250, 140, 119),
                                        Color.fromARGB(255, 243, 48, 96),
                                      ])),
                              width: 95,
                              height: 141,
                              child: Center(
                                child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Shopping',
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ),
                            )),
                        Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color.fromARGB(255, 250, 140, 119),
                                        Color.fromARGB(255, 243, 48, 96),
                                      ])),
                              width: 95,
                              height: 141,
                              child: Center(
                                child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Personal',
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color.fromARGB(255, 250, 140, 119),
                                      Color.fromARGB(255, 243, 48, 96),
                                    ])),
                            width: 95,
                            height: 141,
                            child: Center(
                              child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Work',
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Container(
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15)),
                                gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [
                                      Color.fromARGB(255, 250, 140, 119),
                                      Color.fromARGB(255, 243, 48, 96),
                                    ])),
                            width: 95,
                            height: 141,
                            child: Center(
                              child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'Health',
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Container(
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color.fromARGB(255, 250, 140, 119),
                                        Color.fromARGB(255, 243, 48, 96),
                                      ])),
                              width: 95,
                              height: 141,
                              child: Center(
                                child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      'Others',
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ),
                            )),
                      ],
                    ),
                  )
                  // ListView.builder(
                  //   scrollDirection: Axis.horizontal,
                  //   itemCount: 10,
                  //   itemBuilder: (context, index) {
                  //     return Padding(
                  //       padding: const EdgeInsets.all(12.0),
                  //       child: Container(
                  //         decoration: const BoxDecoration(
                  //             borderRadius: BorderRadius.all(Radius.circular(15)),
                  //             gradient: LinearGradient(
                  //                 begin: Alignment.topCenter,
                  //                 end: Alignment.bottomCenter,
                  //                 colors: [
                  //                   Color.fromARGB(255, 250, 140, 119),
                  //                   Color.fromARGB(255, 243, 48, 96),
                  //                 ])),
                  //         width: 95,
                  //         height: 141,
                  //       ),
                  //     );
                  //   },
                  // ),
                  ,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 28),
                    child: Text(
                      "Today's Task",
                      style: GoogleFonts.montserrat(
                        textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 25,
                          fontWeight: FontWeight.w600,

                          // body: Column(
                          //   crossAxisAlignment:
                          //       CrossAxisAlignment.start, // Align children to the left
                          //   children: [
                          //     Padding(
                          //       padding:
                          //           const EdgeInsets.fromLTRB(32, 120, 0, 0), // Add left padding
                          //       child: Text(
                          //         "Category",
                          //         style: GoogleFonts.montserrat(
                          //           textStyle: const TextStyle(
                          //             color: Colors.black,
                          //             fontSize: 25,
                          //             fontWeight: FontWeight.w600,
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //     Padding(
                          //       padding: const EdgeInsets.fromLTRB(20, 12, 0, 0),
                          //       child: Container(
                          //         height: 150,
                          //         child: SingleChildScrollView(
                          //           scrollDirection: Axis.horizontal,
                          //           child: Row(
                          //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //             children: [
                          //               Padding(
                          //                   padding: const EdgeInsets.all(12.0),
                          //                   child: Container(
                          //                     decoration: const BoxDecoration(
                          //                         borderRadius:
                          //                             BorderRadius.all(Radius.circular(15)),
                          //                         gradient: LinearGradient(
                          //                             begin: Alignment.topCenter,
                          //                             end: Alignment.bottomCenter,
                          //                             colors: [
                          //                               Color.fromARGB(255, 250, 140, 119),
                          //                               Color.fromARGB(255, 243, 48, 96),
                          //                             ])),
                          //                     width: 95,
                          //                     height: 141,
                          //                     child: Center(
                          //                       child: TextButton(
                          //                           onPressed: () {},
                          //                           child: Text(
                          //                             'Shopping',
                          //                             style: TextStyle(color: Colors.white),
                          //                           )),
                          //                     ),
                          //                   )),
                          //               Padding(
                          //                   padding: const EdgeInsets.all(12.0),
                          //                   child: Container(
                          //                     decoration: const BoxDecoration(
                          //                         borderRadius:
                          //                             BorderRadius.all(Radius.circular(15)),
                          //                         gradient: LinearGradient(
                          //                             begin: Alignment.topCenter,
                          //                             end: Alignment.bottomCenter,
                          //                             colors: [
                          //                               Color.fromARGB(255, 250, 140, 119),
                          //                               Color.fromARGB(255, 243, 48, 96),
                          //                             ])),
                          //                     width: 95,
                          //                     height: 141,
                          //                     child: Center(
                          //                       child: TextButton(
                          //                           onPressed: () {},
                          //                           child: Text(
                          //                             'Personal',
                          //                             style: TextStyle(color: Colors.white),
                          //                           )),
                          //                     ),
                          //                   )),
                          //               Padding(
                          //                 padding: const EdgeInsets.all(12.0),
                          //                 child: Container(
                          //                   decoration: const BoxDecoration(
                          //                       borderRadius:
                          //                           BorderRadius.all(Radius.circular(15)),
                          //                       gradient: LinearGradient(
                          //                           begin: Alignment.topCenter,
                          //                           end: Alignment.bottomCenter,
                          //                           colors: [
                          //                             Color.fromARGB(255, 250, 140, 119),
                          //                             Color.fromARGB(255, 243, 48, 96),
                          //                           ])),
                          //                   width: 95,
                          //                   height: 141,
                          //                   child: Center(
                          //                     child: TextButton(
                          //                         onPressed: () {},
                          //                         child: Text(
                          //                           'Work',
                          //                           style: TextStyle(color: Colors.white),
                          //                         )),
                          //                   ),
                          //                 ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    decoration: BoxDecoration(
                        // color: Color.fromARGB(231, 255, 245, 245),
                        borderRadius: BorderRadius.circular(40)),
                    // color: Colors.amber,
                    height: MediaQuery.of(context).size.height,
                    child: ListView.builder(
                        itemCount: todolist.length,
                        itemBuilder: (context, index) {
                          return ToDoCon(
                            taskname: todolist[index],
                            taskcomplete: true,
                            onchanged: (value) => checkBoxChanged(value, index),
                            deletefun: (context) => deleteTask(index),
                            editfunc: (context) {
                              edittask(index);
                              deleteTask(index);
                            },

                            // taskname: todolist[index][0],
                            // tasknompleted: todolist[index][1],
                            // onChanged: (value) => checkbox(value, index),
                            // deleteFunction: (context) => deleteTask(index),
                          );
                        }),
                  ),
                ],
              ) // Add more widgets as needed below
            ],
          ),
        ]));
  }
}
