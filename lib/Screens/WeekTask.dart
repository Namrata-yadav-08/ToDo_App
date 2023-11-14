import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:date_picker_timeline/extra/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/Screens/createtask.dart';
import 'package:todoapp/Screens/register.dart';
import 'package:todoapp/widgets/text.dart';
import 'package:todoapp/widgets/todocontainer.dart';
import 'package:todoapp/widgets/todolist.dart';

class WeekTask extends StatefulWidget {
  const WeekTask({super.key});

  @override
  State<WeekTask> createState() => _WeekTaskState();
}

class _WeekTaskState extends State<WeekTask> {
  DateTime selecteddate = DateTime.now();
  // List todolist = ["Makjjjjjjjjevg", "jghhhhhhhhj", "kjhgfd", "kjhgfddfghjk"];

  // void addtask() {
  //   setState(() {
  //     // String result = createtask() as String;
  //     todolist.add(result);
  //   });

  //   // final _myBox = Hive.box('mybox');

  //   // ToDoDataBase db = ToDoDataBase();
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

  //  void initState() {
  //   // if this is the 1st time ever openin the app, then create default data
  //   if (_myBox.get("TODOLIST") == null) {
  //     db.createInitialData();
  //   } else {
  //     // there already exists data
  //     db.loadData();
  //   }

  //   super.initState();
  // }

  // // text controller
  // final _controller = TextEditingController();
  //  void createNewTask() {
  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return DialogBox(
  //         controller: _controller,
  //         onSave: saveNewTask,
  //         onCancel: () => Navigator.of(context).pop(),
  //       );
  //     },
  //   );
  // }
  //   void checkBoxChanged(bool? value, int index) {
  //   setState(() {
  //     db.toDoList[index][1] = !db.toDoList[index][1];
  //   });
  //   db.updateDataBase();
  // }

  //  void saveNewTask() {
  //   setState(() {
  //     db.toDoList.add([_controller.text, false]);
  //     _controller.clear();
  //   });
  //   Navigator.of(context).pop();
  //   db.updateDataBase();
  // }

  void deleteTask(int index) {
    setState(() {
      todolist.removeAt(index);
    });
    // updateDataBase();
  }

  // void checkbox(bool? value, int index) {
  //   setState(() {
  //     todolist[index][1] = value ?? false;
  //   });
  // }

  // void editTask(int index) {
  //   TextEditingController taskController =
  //       TextEditingController(text: todolist[index]);

  //   showDialog(
  //     context: context,
  //     builder: (context) {
  //       return AlertDialog(
  //         title: Text('Edit Task'),
  //         content: TextField(
  //           controller: taskController,
  //           decoration: InputDecoration(labelText: 'Task Name'),
  //         ),
  //         actions: [
  //           ElevatedButton(
  //             onPressed: () {
  //               Navigator.of(context).pop();
  //             },
  //             child: Text('Cancel'),
  //           ),
  //           ElevatedButton(
  //             onPressed: () {
  //               editTaskName(index, taskController.text);
  //               Navigator.of(context).pop();
  //             },
  //             child: Text('Save'),
  //           ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // void editTaskName(int index, String newTaskName) {
  //   setState(() {
  //     todolist[index] = newTaskName;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 244, 244, 244),
      body: ListView(
        children: [
          User(),
          currentdate(),
          datepicker(),
          // Row(),
          const Padding(padding: EdgeInsets.all(20)),
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
                    taskcomplete: false,
                    onchanged: (bool? value) {},
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
