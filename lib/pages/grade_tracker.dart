import 'package:flutter/material.dart';
import 'package:student_app/bloc/navigation_bloc/navigation_bloc.dart';

class Grade extends StatefulWidget with NavigationStates{
  @override
  _GradeState createState() => _GradeState();
}

class _GradeState extends State<Grade>  {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Grade Tracker Page')),
      backgroundColor: Colors.grey[900],
    );
  }
}
