import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CalendarMonth extends StatefulWidget {
  @override
  _CalendarMonthState createState() => _CalendarMonthState();
}

class _CalendarMonthState extends State<CalendarMonth> {
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              width: 71,
              height: 60,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.blue),
                    width: 22,
                    height: 22,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        size: 15,
                      ),
                      onPressed: _previousMonth,
                    ),
                  ),
                  Text(
                    DateFormat.MMM().format(_currentMonth),
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    width: 22,
                    height: 22,
                    child: IconButton(
                      icon: Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 15,
                      ),
                      onPressed: _nextMonth,
                    ),
                  )
                ],
              ),
            ),
            // Add your calendar UI here for the current month
            // You can use Table, GridView, or any other widget to display the calendar days
            // Example:
            // YourCalendarWidget(currentMonth: _currentMonth),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: CalendarMonth()));
}
