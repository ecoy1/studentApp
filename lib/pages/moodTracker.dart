import 'package:flutter/material.dart';
import 'package:student_app/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:table_calendar/table_calendar.dart';
// class for the mood tracker

class MoodTracker extends StatefulWidget with NavigationStates {
  @override
  _MoodTrackerState createState() => _MoodTrackerState();
}

class _MoodTrackerState extends State<MoodTracker> {

  int difference = (DateTime.now().difference(DateTime(DateTime.now().year, 12, 31)).inDays) * (-1) + 1; // days left in the year
  CalendarController _controller;

  @override
  void initState(){
    super.initState();
    _controller = CalendarController();
  }

  bool _visible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO( 125, 49, 100 , 1),
        centerTitle: true,
        title: Text(
          "Mood Tracker",
          style: TextStyle(
              color: Colors.grey[900],
          ),
        ),
      ),
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [
          TableCalendar(
            initialCalendarFormat: CalendarFormat.month,
            calendarStyle: CalendarStyle(
              todayColor: Color.fromRGBO( 125, 49, 100 , 1),
              selectedColor: Colors.grey[800],
            ),
            startingDayOfWeek: StartingDayOfWeek.monday,
            headerStyle: HeaderStyle(
              centerHeaderTitle: true,
              titleTextStyle: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              formatButtonDecoration: BoxDecoration(
                color: Color.fromRGBO( 125, 49, 100 , 1),
                borderRadius: BorderRadius.circular(20),
              )
            ),
            onDaySelected: (date, event){

            },
            builders: CalendarBuilders(
              dowWeekendBuilder: (context, date) =>
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    date.toString(),
                    style: TextStyle(
                      color: Color.fromRGBO( 255, 94, 199,1 ),
                    ),
                  ),
                ),
              todayDayBuilder: (context, date, events) =>
                  Container(
                    margin: const EdgeInsets.all(4.0),
                    alignment: Alignment.center,
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO( 125, 49, 100 , 1),
                      shape: BoxShape.circle,
                    ),
                  ),
              selectedDayBuilder: (context, date, events) =>
                GestureDetector(
                  onTap: (){
                    setState(() {
                      _visible = !_visible;
                    });
                  },
                  child: AnimatedOpacity(
                    opacity: _visible ? 1.0 : 0.0,
                    duration: Duration(milliseconds: 500),
                    child: Container(
                      margin: const EdgeInsets.all(4.0),
                      alignment: Alignment.center,
                      child: Text(
                          date.day.toString(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[800],
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
              outsideDayBuilder: (context, date, events) =>
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(
                      color: Colors.grey[600],
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              outsideWeekendDayBuilder: (context, date, events) =>
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(
                        color: Color.fromRGBO( 125, 49, 100 , 1),
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  ),
              weekendDayBuilder: (context, date, events) =>
                Container(
                  alignment: Alignment.center,
                  child: Text(
                    date.day.toString(),
                    style: TextStyle(
                      color: Color.fromRGBO( 255, 94, 199,1 ),
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              dayBuilder: (context, date, events) =>
                  Container(
                    alignment: Alignment.center,
                    child: Text(
                        date.day.toString(),
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15,
                      ),
                    ),
                  )
            ),
            calendarController: _controller,
          ),
        ],
      ),
    );
  }
}
