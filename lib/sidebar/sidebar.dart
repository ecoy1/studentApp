import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:student_app/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:student_app/pages/homepage.dart';
import 'package:student_app/sidebar/menu_item.dart';

class SideBar extends StatefulWidget {

  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar> with SingleTickerProviderStateMixin<SideBar>{

  AnimationController _animationController;  //??
  final bool sideBarOpen = true;            //??
  final _animationDuration = const Duration(milliseconds: 500);  //??
  StreamController<bool> sidebarOpenStreamController;
  Stream<bool> sideBarOpenStream;
  StreamSink<bool> sidebarOpenSink;


  @override
  void initState() {  //??
    super.initState();
    _animationController = AnimationController(vsync: this, duration: _animationDuration);
    sidebarOpenStreamController = PublishSubject<bool>();
    sideBarOpenStream = sidebarOpenStreamController.stream;
    sidebarOpenSink = sidebarOpenStreamController.sink;
  }

  @override
  void dispose() {   //??
    _animationController.dispose();
    sidebarOpenStreamController.close();
    sidebarOpenSink.close();
    super.dispose();
  }


  void onIconPressed() { //when you press the menu icon
    final animationStatus = _animationController.status;
    final isAnimationCompleted = animationStatus == AnimationStatus.completed;

    if(isAnimationCompleted) {

      sidebarOpenSink.add(false);

      //animation completed means that the sidebar is open.
      //so clicking has to close it.
      _animationController.reverse();
    } else {
      sidebarOpenSink.add(true);
      //animation not completed means that the sidebar is closed.
      //so clicking has to open it.
      _animationController.forward();
    }

  }

  @override
  Widget build(BuildContext context) {

    final screenWidth = MediaQuery.of(context).size.width;

    return StreamBuilder<bool>(
      initialData: false, //initilally closed
      stream: sideBarOpenStream,
      builder: (context,sidebarOpenedAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,        //because you would want the side bar to start from the bottom to the
          bottom: 0,     //top of the screen
          left: sidebarOpenedAsync.data ? 0 : -screenWidth,  //side bar has to start from the very left both when open and close.
          right: sidebarOpenedAsync.data ? 0 : screenWidth - 45,


          child: Row(
            children: [
              Expanded(
                child: Container( //inside the sidebar
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  color: Color.fromRGBO( 125, 49, 100 , 1),
                  child: Column(
                    children: [
                      SizedBox(
                          height: 100,
                      ),
                      ListTile(
                        title: Text(
                          "Nikol",
                          style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.w800),
                        ),
                        subtitle: Text(
                          "ns1u19@soton.ac.uk",
                          style: TextStyle(
                              color: Colors.white, fontSize: 20, fontWeight: FontWeight.w800
                          ),
                        ),
                        leading: CircleAvatar(
                          child: Icon(
                            Icons.perm_identity,
                            color: Colors.white,
                          ),
                          radius: 40,
                        ),
                      ),
                      Divider(
                        height: 64,
                        thickness: 0.5,
                        color: Colors.grey[900],
                        indent: 20,
                        endIndent: 20,
                      ),
                      MenuItem(
                        icon: Icons.home,
                        title: "Home",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.HomepageClickedEvent);
                        },
                      ),
                      MenuItem(
                        icon: Icons.school,
                        title: "My Grades",
                        onTap: () {
                          onIconPressed();
                          BlocProvider.of<NavigationBloc>(context).add(NavigationEvents.MyGradesClickedEvent);
                        },
                      ),
                      Divider(
                        height: 64,
                        thickness: 0.5,
                        color: Colors.grey[900],
                        indent: 20,
                        endIndent: 20,
                      ),
                      MenuItem(
                        icon: Icons.settings,
                        title: "Settings",
                      ),
                    ],
                  ),
                ),
              ),
              Align(  //This is for the curvy part of the sidebar
                alignment: Alignment(0, -0.9),
                child : GestureDetector(
                  onTap: () {
                    onIconPressed();
                  },
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
                    child: Container(
                      width: 35,
                      height: 110,
                      color: Color.fromRGBO( 125, 49, 100 , 1),
                      alignment: Alignment.centerLeft, //This is for the menu icon
                      child: AnimatedIcon(
                        progress: _animationController.view,
                        icon: AnimatedIcons.menu_close,
                        color: Colors.grey[900],
                        size: 25,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

}
class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {  //this makes the curvy shape of the menu
    Paint paint = Paint();
    paint.color = Colors.white;
    
    final width = size.width;
    final height = size.height;
    
    Path path = Path();
    path.moveTo(0,0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height/2 -20, width, height/2);
    path.quadraticBezierTo(width +1, height/2 +20, 10, height -16);
    path.quadraticBezierTo(0, height -8, 0, height);
    path.close();
    
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
  
}