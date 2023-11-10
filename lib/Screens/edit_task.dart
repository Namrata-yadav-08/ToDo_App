import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Edit_Task extends StatefulWidget {
  const Edit_Task({super.key});

  @override
  State<Edit_Task> createState() => _Edit_TaskState();
}

class _Edit_TaskState extends State<Edit_Task> {
  DateTime selectedDate = DateTime.now();
  Future<void> _selectedDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 244, 244, 244),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(12),
              child: Text(
                'Edit Task',
                style: GoogleFonts.inter(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                    color: Colors.black),
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  height: 64,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  child: Column(children: [
                    Text(
                      'Task Name',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: const Color.fromARGB(127, 0, 0, 0)),
                    ),
                    const TextField()
                  ]),
                )),
            Padding(
                padding: const EdgeInsets.all(12),
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  height: 211,
                  child: Column(children: [
                    Text(
                      'Description',
                      style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                          fontSize: 13,
                          color: const Color.fromARGB(127, 0, 0, 0)),
                    ),
                    const TextField()
                  ]),
                )),
            Padding(
                padding: EdgeInsets.all(12),
                child: Container(
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                    height: 64,
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_month_outlined,
                            ),
                            Text(
                              'Start Date',
                              style: GoogleFonts.montserrat(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 12,
                                  color: const Color.fromARGB(127, 0, 0, 0)),
                            )
                          ],
                        )
                      ],
                    )))
          ],
        ));
  }
}
