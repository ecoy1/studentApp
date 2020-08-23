import 'package:flutter/material.dart';
import 'package:student_app/pages/home.dart';
import 'package:student_app/pages/moodTracker.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes:{
    '/': (context) => Home(),
    '/moodTracker': (context) => moodTracker(),
  }
));

