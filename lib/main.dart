import 'package:flutter/material.dart';
import 'package:student_app/pages/grade_tracker.dart';
import 'package:student_app/pages/homepage.dart';
import 'package:student_app/pages/loading.dart';
import 'package:student_app/sidebar/sidebar_layout.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        primaryColor: Colors.white
      ),
      home: SideBarLayout(),
    );
  }
}

