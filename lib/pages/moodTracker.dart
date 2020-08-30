import 'package:community_material_icon/community_material_icon.dart';
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
  Color daycolor = Color.fromRGBO( 125, 49, 100 , 1);

  @override
  void initState(){
    super.initState();
    _controller = CalendarController();
  }

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
                      color: daycolor,
                      shape: BoxShape.circle,
                    ),
                  ),
              selectedDayBuilder: (context, date, events) =>
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
                    color: Colors.grey[700],
                    shape: BoxShape.circle,
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
      floatingActionButton: new FloatingActionButton(
        child: Text('Mood'),
          backgroundColor: Color.fromRGBO( 125, 49, 100 , 1),
          onPressed: () {
            showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    contentPadding: EdgeInsets.all(5.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    title: Text('How did you feel today ${DateTime
                        .now()
                        .day}.${DateTime
                        .now()
                        .month}?'),
                    content: Container(
                      height: 90.0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                icon: Icon(CommunityMaterialIcons.emoticon_happy),
                                color: Colors.deepPurpleAccent,
                                tooltip: 'Happy\nJoyful\nContent\nRelaxed',
                                onPressed: () {
                                  setState(() {
                                    daycolor = Colors.deepPurpleAccent;
                                  });
                                  Navigator.pop(context);
                                },
                              ),
                              IconButton(
                                icon: Icon(CommunityMaterialIcons.emoticon_sad),
                                color: Colors.blue[800],
                                tooltip: 'Sad\nLonely\nDepressed\nInsecure',
                                onPressed: () {
                                  setState(() {
                                    daycolor = Colors.blue[800];
                                  });
                                  Navigator.pop(context);
                                },
                              ),
                              IconButton(
                                icon: Icon(CommunityMaterialIcons.github),
                                color: Colors.green[800],
                                tooltip: 'Productive\nMotivated\nAlive\nExcited',
                                onPressed: () {
                                  setState(() {
                                    daycolor = Colors.green[800];
                                  });
                                  Navigator.pop(context);
                                },
                              ),
                              IconButton(
                                icon: Icon(CommunityMaterialIcons.battery_low),
                                color: Colors.yellow,
                                tooltip: 'Sick\nTired\nBored\nLazy',
                                onPressed: () {
                                  setState(() {
                                    daycolor = Colors.yellow;
                                  });
                                  Navigator.pop(context);
                                },
                              ),
                              IconButton(
                                icon: Icon(CommunityMaterialIcons.emoticon_neutral),
                                color: Colors.orange[800],
                                tooltip: 'Average\nNormal\nFine\nOK',
                                onPressed: () {
                                  setState(() {
                                    daycolor = Colors.orange[800];
                                  });
                                  Navigator.pop(context);
                                },
                              ),
                              IconButton(
                                icon: Icon(CommunityMaterialIcons.emoticon_angry),
                                color: Colors.red[700],
                                tooltip: 'Angry\nAnxious\nFrustrated\nAnnoyed',
                                onPressed: () {
                                  setState(() {
                                    daycolor = Colors.red[700];
                                  });
                                  Navigator.pop(context);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }
            );
          }
      ),
    );
  }
}
