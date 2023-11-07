import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:date_picker_timeline/extra/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/Screens/register.dart';
import 'package:todoapp/widgets/text.dart';
import 'package:todoapp/widgets/todocontainer.dart';

class WeekTask extends StatefulWidget {
  const WeekTask({super.key});

  @override
  State<WeekTask> createState() => _WeekTaskState();
}

class _WeekTaskState extends State<WeekTask> {
  DateTime selecteddate = DateTime.now();
  List todolist = ["Makevg", "jggj", "gytg"];
  // void addnewtask() {
  //   setState(() {
  //     todolist.add([controller.text, false]);
  //   });
  // }
  void deletetask(int index) {
    todolist.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(244, 229, 237, 242),
      body: ListView(
        children: [
          User(),
          currentdate(),
          datepicker(),
          // Row(),
          const Padding(padding: EdgeInsets.all(20)),
          Container(
            decoration: BoxDecoration(
                color: const Color.fromRGBO(208, 198, 198, 0.906),
                borderRadius: BorderRadius.circular(40)),
            // color: Colors.amber,
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
                itemCount: todolist.length,
                itemBuilder: (context, index) {
                  return ToDoCon(
                    taskname: todolist[index],
                    taskcomplete: false,
                    deletefun: (context) => deletetask(index),
                  );
                }),
          ),
          // FloatingActionButton(
          //   child: Text("register"),
          //   onPressed: () {
          //     Navigator.push(
          //         context, MaterialPageRoute(builder: (context) => Register()));
          //   },
          // )
        ],
      ),
    );
  }

  // Padding paddingtodo() {
  //   return Padding(
  //       padding: EdgeInsets.only(bottom: 16, left: 20, right: 20),
  //       child: ToDoCon(
  //         taskname: todolist[index],
  //         taskcomplete: false,
  //       ));
  // }

  Row currentdate() {
    return Row(
      children: [
        // Padding(padding: EdgeInsets.all(13)),

        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat.yMMMEd().format(DateTime.now()),
                style: const TextStyle(fontSize: 15, color: Colors.grey),
              ),
              const CustomText(
                text: "Week's Tasks",
                fontStyle: null,
                color: Colors.black,
                fontweigth: FontWeight.bold,
                fontSize: 30,
              )
            ],
          ),
        ),
      ],
    );
  }

  Slidable datepicker() {
    return Slidable(
      // endActionPane: ,
      endActionPane: const ActionPane(
        motion: StretchMotion(),
        children: [
          Icon(Icons.delete),
          // SlidableAction(
          //   onPressed: () {},
          //   icon: FontAwesomeIcons.deleteLeft,
          // ),
          // SlidableAction(
          //   onPressed: donefun,
          //   icon: Icons.done,
          // ),
          // SlidableAction(
          //   onPressed: editfunc,
          //   icon: Icons.edit,
          // )
        ],
      ),
      child: Container(
        margin: const EdgeInsets.only(top: 20),
        child: DatePicker(
          DateTime.now(),
          height: 100,
          width: 80,
          initialSelectedDate: DateTime.now(),
          selectionColor: const Color.fromRGBO(254, 155, 143, 1),
          selectedTextColor: const Color.fromRGBO(255, 255, 255, 1),
          dateTextStyle: const TextStyle(
              fontSize: 16, fontWeight: FontWeight.w600, color: Colors.grey),
          onDateChange: (date) {
            selecteddate = date;
          },
        ),
      ),
    );
  }

  Container User() {
    return Container(
      // color: Colors.amber,
      // padding: EdgeInsets.all(15)
      padding: const EdgeInsets.only(top: 30, left: 20),
      // margin: EdgeInsets.all(20),
      child: const CustomText(
        text: "Hey User",
        fontStyle: null,
        color: Colors.black,
        fontSize: 30,
        fontweigth: FontWeight.bold,
      ),
    );
  }

  // Widget taskcontainer(BuildContext context) => Container(child: );
}
