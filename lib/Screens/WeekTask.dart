import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:date_picker_timeline/extra/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:todoapp/Screens/createtask.dart';
import 'package:todoapp/Screens/register.dart';
import 'package:todoapp/widgets/TaskList.dart';
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

  // void addtask() {
  //   setState(() {
  //     // String result = createtask() as String;
  //     todolist.add(result);
  //   });
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

  // List getTasksForDate(DateTime date) {
  //   // Filter tasks based on the selected date
  //   return todolist.where((task) => task.date.isAtSameMomentAs(date)).toList();
  // }

  // void editTasks(int index) {
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
  DateTime _currentMonth = DateTime.now();

  void _previousMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month - 1);
    });
  }

  void _nextMonth() {
    setState(() {
      _currentMonth = DateTime(_currentMonth.year, _currentMonth.month + 1);
    });
  }

  String? userImage;
  @override
  Widget build(BuildContext context) {
    final currentDate = DateTime.now();
    final formattedDate = DateFormat('MMM dd, y').format(currentDate);
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 244, 244, 244),
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
                'Hey User',
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
              backgroundImage: userImage != null && userImage!.isNotEmpty
                  ? NetworkImage(userImage!) // User's image if available
                  : AssetImage('assets/images/Group 171 (2).png')
                      as ImageProvider<Object>,
              radius: 24,
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15),
        child: ListView(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(13),
                  child: Text(
                    "Week's Task",
                    style: GoogleFonts.inter(
                      textStyle: const TextStyle(
                        color: Colors.black,
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(right: 12),
                  child: Container(
                    color: Colors.white,
                    // width: 71,
                    // height: 60,
                    child: Row(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color.fromARGB(255, 76, 75, 254)),
                          width: 25,
                          height: 25,
                          child: Center(
                            child: IconButton(
                              icon: Icon(
                                Icons.arrow_back_ios_rounded,
                                size: 11,
                                color: Colors.white,
                              ),
                              onPressed: _previousMonth,
                            ),
                          ),
                        ),
                        Text(
                          DateFormat.MMM().format(_currentMonth),
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        ),
                        Container(
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 76, 75, 254)),
                            width: 25,
                            height: 25,
                            child: Center(
                              child: IconButton(
                                icon: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 11,
                                  color: Colors.white,
                                ),
                                onPressed: _nextMonth,
                              ),
                            ))
                      ],
                    ),
                  ),
                ),
              ],
            ),
            // User(),
            // currentdate(),
            datepicker(),
            //           // ...
            // GradientDatePicker(
            //   initialDate: DateTime.now(),
            //   onDateChange: (date) {
            //     // Handle date change
            //   },
            // ),
            // // ...

            // Row(),

            Container(
              decoration: BoxDecoration(
                  // color: Color.fromARGB(231, 255, 245, 245),
                  borderRadius: BorderRadius.circular(40)),
              // color: Colors.amber,
              height: MediaQuery.of(context).size.height,
              child: ListView.builder(
                  itemCount: todolist.length,
                  itemBuilder: (context, index) {
                    // ToDo task = getTasksForDate(selecteddate)[index];
                    return ToDoCon(
                      taskname: todolist[index],
                    taskcomplete: false,
                      onChanged: (bool? value) {},
                      deletefun: (context) => deleteTask(index),
                      editfunc: (context) {
                        edittask(index);
                        deleteTask(index);
                      }, onchanged: (bool? v) {  },
                      // taskdescription: todolist[index],

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
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     // Navigate to the create task screen
      //     final result = await Navigator.push(
      //       context,
      //       MaterialPageRoute(builder: (context) => const createtask()),
      //     );

      //     // Check if the result is not null (user added a task)
      //     if (result != null) {
      //       setState(() {
      //         todolist.add(result);
      //       });

      //       // Add the task to the list or update the UI as needed
      //       // You can update the UI using setState if necessary
      //     }
      //   },
      //   child: const Icon(Icons.add),
      // ),
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
              dateTextStyle: GoogleFonts.inter(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: Colors.black),
              onDateChange: (date) {
                selecteddate = date;
              },
              // dayContainerDecoration: BoxDecoration(
              //   gradient: LinearGradient(
              //     colors: [
              //       Color.fromRGBO(254, 155, 143, 1),
              //       Color.fromRGBO(255, 94, 77, 1),
              //     ],
              //     begin: Alignment.topLeft,
              //     end: Alignment.bottomRight,
              //   ),
              //   borderRadius: BorderRadius.circular(16),
              // ),
            )));
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
