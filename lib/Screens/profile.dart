import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: const Color.fromARGB(255, 244, 244, 244),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Column(
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
                      Text('Nammo'),
                    ],
                  ),
                ),
              ),
              Padding(padding: EdgeInsets.all(10)),
              Row(
                children: [
                  Container(
                    color: Colors.white,
                  ),
                  Container(),
                ],
              ),
              Text('settings'),
              Container(
                width: 90,
                height: 30,
                color: Colors.white,
              ),
              Container(
                width: 90,
                height: 30,
                color: Colors.white,
              ),
              Container(
                width: 90,
                height: 30,
                color: Colors.white,
              ),
              Text('settings'),
              Container(
                width: 90,
                height: 30,
                color: Colors.white,
              ),
              Container(
                width: 90,
                height: 30,
                color: Colors.white,
              ),
              Text('Account'),
              Container(
                width: 90,
                height: 30,
                color: Colors.white,
              ),
              Container(
                width: 90,
                height: 30,
                color: Colors.white,
              ),
              Container(
                width: 90,
                height: 30,
                color: Colors.white,
              )
            ],
          )),
    );
  }
}
