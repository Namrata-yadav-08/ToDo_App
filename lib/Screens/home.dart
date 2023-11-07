import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    // final currentDate = DateTime.now();
    // final formattedDate =
    //     "${currentDate.day}-${currentDate.month}-${currentDate.year}";
    final currentDate = DateTime.now();
    final formattedDate = DateFormat('MMM dd, y').format(currentDate);
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 244, 244, 244),
        extendBody: true,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          toolbarHeight: 77,
          elevation: 0,
          backgroundColor: const Color.fromARGB(255, 244, 244, 244),
          title: Padding(
            padding: const EdgeInsets.fromLTRB(26, 20, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hey ',
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
            const Padding(
              padding: EdgeInsets.fromLTRB(0, 28, 26, 0),
              child: CircleAvatar(
                backgroundImage: NetworkImage(''),
                radius: 24,
              ),
            )
          ],
        ),
        body: Column(
          crossAxisAlignment:
              CrossAxisAlignment.start, // Align children to the left
          children: [
            Padding(
              padding:
                  const EdgeInsets.fromLTRB(32, 120, 0, 0), // Add left padding
              child: Text(
                "Categs",
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 12, 0, 0),
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
                                  onPressed: () {}, child: Text('Shopping')),
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
                                  onPressed: () {}, child: Text('Shopping')),
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
                          child: Column(children: [
                            Image.asset(
                              'assets/images/Group 177.png',
                            ),
                            TextButton(
                                onPressed: () {}, child: Text('Shopping')),
                            Text('2 tasks')
                          ]),
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
                                  onPressed: () {}, child: Text('Shopping')),
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
                                  onPressed: () {}, child: Text('Shopping')),
                            ),
                          ))
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
            Padding(
              padding:
                  const EdgeInsets.fromLTRB(28, 12, 0, 0), // Add left padding
              child: Text(
                "Today's Task",
                style: GoogleFonts.montserrat(
                  textStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ) // Add more widgets as needed below
          ],
        ));
    // Container(
    //   height: 150,
    //   child: ListView.builder(
    //     scrollDirection: Axis.horizontal,
    //     itemCount: 10,
    //     itemBuilder: (context, index) {
    //       return Container(
    //         decoration: BoxDecoration(
    //             gradient: LinearGradient(colors: [
    //           Color.fromARGB(255, 250, 140, 119),
    //           Color.fromARGB(255, 243, 48, 96),
    //         ])),
    //         width: 95,
    //         height: 141,
    //       );
    //     },
    //   ),
    // ));
  }
}
