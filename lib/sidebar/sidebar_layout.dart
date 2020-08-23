import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:student_app/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:student_app/pages/homepage.dart';
import 'package:student_app/sidebar/sidebar.dart';

class SideBarLayout extends StatefulWidget {
  @override
  _SideBarLayoutState createState() => _SideBarLayoutState();
}

class _SideBarLayoutState extends State<SideBarLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider<NavigationBloc>(
        create: (context) => NavigationBloc(),
        child: Stack( //So here HomePage and SideBar are stacked on top of each other.
          children: [
            BlocBuilder<NavigationBloc, NavigationStates> (
              builder: (context, navigationState) {
                return navigationState as Widget;
              },
            ),      //This is added to the stack first
            SideBar()   //This is added on top of SideBar
          ],
        ), 
      ),
    );
  }
}



