import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:todoapp/Screens/WeekTask.dart';
import 'package:todoapp/Screens/focus.dart';
import 'package:todoapp/Screens/home.dart';
import 'package:todoapp/Screens/profile.dart';

class Main_Screen extends StatefulWidget {
  const Main_Screen({super.key});

  @override
  State<Main_Screen> createState() => _Main_ScreenState();
}

class _Main_ScreenState extends State<Main_Screen> {
  int _index = 0;
  final screens = [
    const Home(),
    const WeekTask(),
    const InFocus(),
    const Profile()
  ];
  final navigationKey = GlobalKey<CurvedNavigationBarState>();
  Shader _headerGradient(BuildContext context) {
    return const LinearGradient(
      colors: <Color>[
        Color.fromARGB(255, 250, 140, 119),
        Color.fromARGB(255, 243, 48, 96),
      ],
    ).createShader(
        Rect.fromLTWH(0, 0, MediaQuery.of(context).size.width, 70.0));
  }

  @override
  Widget build(BuildContext context) {
    final items = <Widget>[
      const Icon(FontAwesomeIcons.houseChimneyWindow, size: 25),
      const Icon(FontAwesomeIcons.calendarDays, size: 25),
      const SizedBox(
        width: 20,
      ),
      const Icon(FontAwesomeIcons.solidClock, size: 25),
      const Icon(FontAwesomeIcons.userLarge, size: 25),
    ];
    final height = MediaQuery.of(context).size.height;
    if (_index < 0) {
      _index = 0;
    } else if (_index >= screens.length) {
      _index = screens.length - 1;
    }
    return Container(
        color: const Color.fromARGB(255, 54, 54, 54),
        child: SafeArea(
            top: false,
            child: ClipRect(
                child: Scaffold(
                    backgroundColor: const Color.fromARGB(255, 19, 19, 21),
                    extendBody: true,
                    extendBodyBehindAppBar: true,
                    body: screens[_index],
                    floatingActionButton: Container(
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          boxShadow: [
                            BoxShadow(color: Colors.transparent),
                            BoxShadow(
                                color: Color.fromARGB(10, 0, 0, 0),
                                offset: Offset(0, 0),
                                blurRadius: 6,
                                spreadRadius: 0),
                            BoxShadow(
                                color: Color.fromARGB(31, 239, 35, 85),
                                offset: Offset(0, 2),
                                blurRadius: 6,
                                spreadRadius: 0),
                            BoxShadow(
                                color: Color.fromARGB(51, 239, 35, 85),
                                offset: Offset(0, 16),
                                blurRadius: 24,
                                spreadRadius: 0)
                          ],
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            colors: <Color>[
                              Color.fromARGB(255, 250, 140, 119),
                              Color.fromARGB(255, 243, 48, 96),
                            ],
                          )),
                      height: 65,
                      width: 65,
                      child: FloatingActionButton(
                        onPressed: () {
                          Navigator.pushNamed(context, 'createtask');
                        },
                        // backgroundColor: const Color.fromARGB(255, 77, 78, 237),
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                        child: const Icon(
                          Icons.add,
                          size: 35,
                        ),
                      ),
                    ),
                    floatingActionButtonLocation: FloatingActionButtonLocation
                        .centerDocked, // Adjust the location as needed
                    bottomNavigationBar: Theme(
                        data: Theme.of(context).copyWith(
                            iconTheme: const IconThemeData(
                                color: Color.fromARGB(255, 245, 69, 101))),
                        child: CurvedNavigationBar(
                          key: navigationKey,
                          color: const Color.fromARGB(255, 255, 255, 255),
                          buttonBackgroundColor:
                              const Color.fromARGB(244, 244, 244, 244),
                          backgroundColor: Colors.transparent,
                          items: items,
                          animationCurve: Curves.easeInOut,
                          animationDuration: const Duration(milliseconds: 300),
                          height: 60,
                          index: _index,
                          onTap: (value) {
                            setState(() {
                              _index = value;
                            });
                          },
                        ))))));
  }
}
