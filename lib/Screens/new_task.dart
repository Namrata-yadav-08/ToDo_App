import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class New_Task extends StatefulWidget {
  const New_Task({super.key});

  @override
  State<New_Task> createState() => _New_TaskState();
}

class _New_TaskState extends State<New_Task> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromRGBO(244, 244, 255, 1),
        body: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: 170,
            height: 84,
            margin: const EdgeInsets.only(top: 52, left: 26),
            child: const Text('CREATE NEW TASK',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600)),
          ),
          Container(
            width: 84,
            height: 22,
            margin: const EdgeInsets.only(top: 26, left: 26),
            child: const Text(
              'TASK TITLE',
              style: TextStyle(fontSize: 15),
            ),
          ),
          const TextField(),
          Row(
            children: [
              Container(
                width: 148,
                height: 61,
                margin: const EdgeInsets.only(top: 43, left: 26),
                color: Colors.grey,
              ),
              Container(
                width: 148,
                height: 61,
                margin: const EdgeInsets.only(top: 43, left: 17),
                color: Colors.grey,
              )
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 148,
                height: 61,
                margin: const EdgeInsets.only(top: 43, left: 26),
                color: Colors.grey,
              ),
              Container(
                width: 148,
                height: 61,
                margin: const EdgeInsets.only(top: 43, left: 17),
                color: Colors.grey,
              )
            ],
          ),
          Container(
              width: 115,
              height: 22,
              margin: const EdgeInsets.only(top: 32, left: 26),
              child: const Text(
                  textAlign: TextAlign.left,
                  'DISCRIPTION',
                  style: TextStyle(fontSize: 18))),
          const TextField(),
          Container(
              height: 18,
              width: 89,
              margin: const EdgeInsets.only(top: 47, left: 26),
              child: const Text('CATEGORY')),
          Padding(
              padding: const EdgeInsets.fromLTRB(16, 12, 0, 0),
              child: Container(
                height: 45,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(5),
                            child: Container(
                              // margin: EdgeInsets.only(top: 25),
                              decoration: const BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(6)),
                                  gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color.fromARGB(255, 254, 152, 142),
                                        Color.fromARGB(255, 255, 100, 125)
                                      ])),
                              width: 90,
                              height: 35,
                              child: Center(
                                  child: TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Categs",
                                  style: GoogleFonts.inter(
                                    textStyle: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              )),
                            )),
                        Padding(
                            padding: const EdgeInsets.all(5),
                            child: Container(
                                // margin: EdgeInsets.only(top: 25),
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6)),
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color.fromARGB(255, 254, 152, 142),
                                          Color.fromARGB(255, 255, 100, 125)
                                        ])),
                                width: 90,
                                height: 35,
                                child: Center(
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Categs",
                                      style: GoogleFonts.inter(
                                        textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ))),
                        Padding(
                            padding: const EdgeInsets.all(5),
                            child: Container(
                                // margin: EdgeInsets.only(top: 25),
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6)),
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color.fromARGB(255, 254, 152, 142),
                                          Color.fromARGB(255, 255, 100, 125)
                                        ])),
                                width: 90,
                                height: 35,
                                child: Center(
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Categs",
                                      style: GoogleFonts.inter(
                                        textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ))),
                        Padding(
                            padding: const EdgeInsets.all(5),
                            child: Container(
                                // margin: EdgeInsets.only(top: 25),
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6)),
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color.fromARGB(255, 254, 152, 142),
                                          Color.fromARGB(255, 255, 100, 125)
                                        ])),
                                width: 90,
                                height: 35,
                                child: Center(
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Categs",
                                      style: GoogleFonts.inter(
                                        textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ))),
                        Padding(
                            padding: const EdgeInsets.all(5),
                            child: Container(
                                // margin: EdgeInsets.only(top: 25),
                                decoration: const BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(6)),
                                    gradient: LinearGradient(
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                        colors: [
                                          Color.fromARGB(255, 254, 152, 142),
                                          Color.fromARGB(255, 255, 100, 125)
                                        ])),
                                width: 90,
                                height: 35,
                                child: Center(
                                  child: TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Categs",
                                      style: GoogleFonts.inter(
                                        textStyle: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  ),
                                ))),

                        //   Container(
                        //       margin: EdgeInsets.only(top: 25),
                        //       decoration: BoxDecoration(
                        //           gradient: LinearGradient(colors: [
                        //         Color.fromARGB(1, 254, 152, 142),
                        //         Color.fromARGB(1, 255, 100, 125)
                        //       ])),
                        //       child: Text(
                        //         'LEARNING',
                        //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                        //       )),
                        //   Container(
                        //       margin: EdgeInsets.only(top: 25),
                        //       decoration: BoxDecoration(
                        //           gradient: LinearGradient(colors: [
                        //         Color.fromARGB(1, 254, 152, 142),
                        //         Color.fromARGB(1, 255, 100, 125)
                        //       ])),
                        //       child: Text(
                        //         'MEETING',
                        //         style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                        //       )),
                        // ]),
                        Align(
                          alignment: FractionalOffset.center,
                          child: ElevatedButton(
                            child: Container(
                                margin: const EdgeInsets.only(top: 30),
                                decoration: const BoxDecoration(
                                    boxShadow: [],
                                    gradient: LinearGradient(
                                      begin: Alignment.topCenter,
                                      end: Alignment.bottomCenter,
                                      colors: [
                                        Color.fromRGBO(254, 152, 142, 1),
                                        Color.fromRGBO(255, 100, 125, 1)
                                      ],
                                    )),
                                child: const Text(
                                  'CREATE TASK',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.w500,
                                  ),
                                )),
                            onPressed: () {},
                          ),
                        ),
                      ]),
                ),
              ))
        ]));
  }
}
