import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:student_app/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:student_app/tasks/task.dart';

class HomePage extends StatefulWidget with NavigationStates {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<HomePage> {

  final List<Task> tasks = new List();

  var now = new DateTime.now();
  final int day = DateTime
      .now()
      .day;
  final int year = DateTime
      .now()
      .year;
  final int month = DateTime
      .now()
      .month;


  String method() {
    var monthNames = ["January", "February", "March", "April", "May", "June",
      "July", "August", "September", "October", "November", "December"
    ];
    final String monthName = monthNames.elementAt(this.month - 1);
//String monthName = getmontz[DateTime.now().month];
    return monthName;
  }




  @override
  void initState() {
    super.initState();
    setState(() {
      tasks.add(new Task("Study Algorithmics", "Do Lesson 2", "12:30" , Colors.red));


    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container( //this creates a container of the width and the height of the screen
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Positioned(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                ),
                child: _myHeaderContent(),
              ),
            ),

            Positioned(
              top: 190.0,
              left: 18.0,
              child: Container(
                color: Colors.grey[900],
                width: 380.0,
                height: MediaQuery.of(context).size.height / 1.5,
                child: ListView.builder(
                    itemCount: tasks.length,
                    itemBuilder: (context, position) {
                      return Dismissible(
                          key: Key(tasks[position].toString()),
                          background: _myHiddenContainer(
                              tasks[position].status),
                          child: _myListContainer(
                            tasks[position].taskname, tasks[position].subtask,
                            tasks[position].tasktime, tasks[position].status),
                        onDismissed: (direction) {
                            if(direction == DismissDirection.startToEnd) {
                              Scaffold.of(context).showSnackBar(
                                SnackBar(content: Text("Delete")));
                              if(tasks.contains(tasks.removeAt(position))) {
                                setState(() {
                                  tasks.remove(tasks.removeAt(position));
                                });
                              }
                            } else
                              if(direction == DismissDirection.endToStart) {
                                Scaffold.of(context).showSnackBar(
                                  SnackBar(content: Text('Archive')));
                              }
                        },
                      );
                    }),
            ),
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton.extended(
      backgroundColor: Colors.amber,
          foregroundColor: Colors.deepOrange,
          onPressed: () {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    final taskval = TextEditingController();
                    final subval = TextEditingController();
                    final tasktime = TextEditingController();

                    Color taskcolor;

                    return AlertDialog(
                      title: Text('New Task'),
                      content: Container(
                        height: 250.0,
                        child: Column(
                          children: [
                            Container(
                              child: TextField(
                                controller: subval,
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                border: InputBorder.none,
                                  hintText: 'Task Title',
                                  hintStyle: TextStyle(color: Colors.grey))
                              ),
                            ),
                            Container(
                              child: TextField(
                                controller: taskval,
                                obscureText: false,
                                textAlign: TextAlign.left,
                                decoration: InputDecoration(
                                border: InputBorder.none,
                                  hintText: 'Sub Task',
                                  hintStyle: TextStyle(color: Colors.grey)
                                ),
                              ),
                            ),
                            Container(
                              child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  new GestureDetector(
                                    onTap: () {
                                      taskcolor=Colors.pink;
                                    },
                                    child: Container(
                                      width: 20.0,
                                      height: 20.0,
                                      color: Colors.pink,
                                    ),
                                  ),
                                  new GestureDetector(
                                    onTap: () {
                                      taskcolor=Colors.amber;
                                    },
                                    child: Container(
                                      width: 20.0,
                                      height: 20.0,
                                      color: Colors.amber,
                                    ),
                                  ),
                                  new GestureDetector(
                                    onTap: () {
                                      taskcolor=Colors.lightBlue;
                                    },
                                    child: Container(
                                      width: 20.0,
                                      height: 20.0,
                                      color: Colors.lightBlue,
                                    ),
                                  ),
                                  new GestureDetector(
                                    onTap: () {
                                      taskcolor=Colors.greenAccent;
                                    },
                                    child: Container(
                                      width: 20.0,
                                      height: 20.0,
                                      color: Colors.greenAccent,
                                    ),
                                  ),
                                ],
                            )),
                            Container(
                             child: TextField(
                               controller: tasktime,
                               obscureText: false,
                               textAlign: TextAlign.left,
                               decoration: InputDecoration(
                                 border: InputBorder.none,
                                 hintText: 'Task Time',
                                 hintStyle: TextStyle(color: Colors.grey)
                               ),
                             ),
                            )
                          ],
                        ),
                    ),
                      actions: [
                        RaisedButton(
                          shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(30.0)),
                          color: Colors.black12,
                          child: Text('Add',style: new TextStyle(color: Colors.white)),
                          onPressed: () {
                            setState(() {
                              tasks.add(new Task(
                                taskval.text,subval.text,tasktime.text,taskcolor));
                            });
                            Navigator.pop(context);
                          },
                        )
                      ],
                    );
                  }
              );


          },
          tooltip: 'Increment',
        label: Text('Add Task'),
        icon: Icon(Icons.add),
      ),
    );
  }



  Widget _myHeaderContent() {
    String stringMonth = method();
    return Align(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 20, 20, 10),
        child: ListTile(
          leading: Text(
            '$day' , style: TextStyle(fontSize: 50.0,color: Colors.amber),
          ),
          title: Text(
            '$stringMonth' , style: TextStyle(fontSize: 50.0,color: Colors.white) ,
          ),
          subtitle: Text(
            '$year' , style: TextStyle(fontSize: 50.0,color: Colors.white) ,
          ),
        ),
      ),
    );
  }
  Widget _myListContainer(String taskName,String subTask, String taskTime, Color taskColor) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 80.0,
        child: Material(   //THE TASK BOXES
          color: Colors.white,
          elevation: 14.0,
          shadowColor: Colors.amber,
          child: Container(
            child: Row(
              children: [
                Container(  //color of the task
                  height: 80.0,
                  width: 10.0,
                  color: taskColor,
                ),
                Expanded(  //so that the container of the task color is expanded
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            child: Text(taskName, style: TextStyle(
                                fontSize: 24.0,
                                color: Colors.black,
                                fontWeight: FontWeight.bold)),
                          ),
                        ),
                        Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            child: Text(subTask, style: TextStyle(
                                fontSize: 18.0, color: Colors.black),),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Text(taskTime, style: TextStyle(
                          fontSize: 18.0, color: Colors.black),),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _myHiddenContainer(Color taskColor) {
    return Container(
      height: MediaQuery.of(context).size.height,
      color: taskColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Align(
        alignment: Alignment.centerLeft,
        child: IconButton(
          icon: Icon(Icons.delete),
          color: Colors.white,
          onPressed: () {
            setState(() {

            });
          },
        ),
        ),
          Align(
            alignment: Alignment.centerRight,
            child: IconButton(
              icon: Icon(Icons.archive),
                color: Colors.white,
              onPressed: () {
                setState(() {

                });
              },
            ),
          ),
        ],
      ),
    );
  }


















}

