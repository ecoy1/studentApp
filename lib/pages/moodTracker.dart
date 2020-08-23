import 'package:flutter/material.dart';
// class for the mood tracker

class moodTracker extends StatefulWidget {
  @override
  _moodTrackerState createState() => _moodTrackerState();
}

class _moodTrackerState extends State<moodTracker> {
  
  var now = DateTime.now();
  var end_of_year = DateTime(2020, 12, 31);
  var difference = now.difference(end_of_year).inDays;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO( 125, 49, 100 , 1),
        title: Text('Mood Tracker'),
      ),
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [

        ],
      ),
    );
  }
}
