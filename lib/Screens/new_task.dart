import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      backgroundColor: Color.fromRGBO(244, 244, 255, 1),
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            width: 170,
            height: 84,
            margin: EdgeInsets.only(top: 52, left: 26),
            child: Text('CREATE NEW TASK',
                style: TextStyle(fontSize: 32, fontWeight: FontWeight.w600)),
          ),
          Container(
            width: 84,
            height: 22,
            margin: EdgeInsets.only(top: 26, left: 26),
            child: Text(
              'TASK TITLE',
              style: TextStyle(fontSize: 15),
            ),
          ),
          TextField(),
          Row(
            children: [
              Container(
                width: 148,
                height: 61,
                margin: EdgeInsets.only(top: 43, left: 26),
                color: Colors.grey,
              ),
              Container(
                width: 148,
                height: 61,
                margin: EdgeInsets.only(top: 43, left: 17),
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
                margin: EdgeInsets.only(top: 43, left: 26),
                color: Colors.grey,
              ),
              Container(
                width: 148,
                height: 61,
                margin: EdgeInsets.only(top: 43, left: 17),
                color: Colors.grey,
              )
            ],
          ),
          Container(
              width: 115,
              height: 22,
              margin: EdgeInsets.only(top: 32, left: 26),
              child: Text(
                  textAlign: TextAlign.left,
                  'DISCRIPTION',
                  style: TextStyle(fontSize: 18))),
          TextField(),
          Container(
              height: 18,
              width: 89,
              margin: EdgeInsets.only(top: 47, left: 26),
              child: Text('CATEGORY')),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
            Container(
                margin: EdgeInsets.only(top: 25),
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color.fromARGB(1, 254, 152, 142),
                  Color.fromARGB(1, 255, 100, 125)
                ])),
                child: Text(
                  'SHOPING',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                )),
            Container(
                margin: EdgeInsets.only(top: 25),
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color.fromARGB(1, 254, 152, 142),
                  Color.fromARGB(1, 255, 100, 125)
                ])),
                child: Text(
                  'LEARNING',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                )),
            Container(
                margin: EdgeInsets.only(top: 25),
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  Color.fromARGB(1, 254, 152, 142),
                  Color.fromARGB(1, 255, 100, 125)
                ])),
                child: Text(
                  'MEETING',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                )),
          ]),
          Align(
            alignment: FractionalOffset.center,
            child: ElevatedButton(
              child: Container(
                  margin: EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                      boxShadow: [],
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color.fromRGBO(254, 152, 142, 1),
                          Color.fromRGBO(255, 100, 125, 1)
                        ],
                      )),
                  child: Text(
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
    ));
  }
}
