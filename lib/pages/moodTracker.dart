import 'package:flutter/material.dart';
import 'package:student_app/bloc/navigation_bloc/navigation_bloc.dart';
// class for the mood tracker

class MoodTracker extends StatefulWidget with NavigationStates {
  @override
  _MoodTrackerState createState() => _MoodTrackerState();
}

class _MoodTrackerState extends State<MoodTracker> {
  
  var now = DateTime.now();
  var end_of_year = DateTime(2020, 12, 31);
 // var difference = now.difference(end_of_year).inDays;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: Column(
        children: [

        ],
      ),
    );
  }
}
