import 'package:flutter/material.dart';
import 'package:student_app/bloc/navigation_bloc/navigation_bloc.dart';

class HomePage extends StatefulWidget with NavigationStates {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Home Page')),
      backgroundColor: Colors.grey[900],
    );
  }
}


/*
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('Home Page')),
      backgroundColor: Colors.grey[900],
    );
  }
}*/


/*class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO( 125, 49, 100 , 1),
        title: Text('This be burgundy'),
      ),
      backgroundColor: Colors.grey[900],
    );
  }
}*/
