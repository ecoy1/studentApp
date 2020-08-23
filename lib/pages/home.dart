import 'package:flutter/material.dart';

//home page  with the side bar with the buttons and some
//basic features

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO( 125, 49, 100 , 1),
        title: Text('Home'),
      ),
      backgroundColor: Colors.grey[900],
      body: SafeArea(
        child: FlatButton.icon(
            onPressed: () {
              Navigator.pushNamed(context, '/moodTracker');
            },
            icon: Icon(
              Icons.mood,
              color: Colors.white,
            ),
            label: Text(
              'Mood Tracker',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
                letterSpacing:2.0,
              ),
            ),
        ),
      ),
    );
  }
}
