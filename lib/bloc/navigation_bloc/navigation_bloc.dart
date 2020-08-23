import 'package:bloc/bloc.dart';
import 'package:student_app/pages/grade_tracker.dart';
import 'package:student_app/pages/homepage.dart';
import 'package:student_app/pages/moodTracker.dart';
import '';

enum NavigationEvents { HomepageClickedEvent, MyGradesClickedEvent, MoodTrackerClickedEvent}

abstract class NavigationStates{}

class NavigationBloc extends Bloc<NavigationEvents,NavigationStates> {
  @override
  NavigationStates get initialState => HomePage();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async*{ //when there's a change in the event his method is called
    switch (event) {
      case NavigationEvents.HomepageClickedEvent:
        yield HomePage();
      break;
      case NavigationEvents.MyGradesClickedEvent:
        yield Grade();
        break;
      case NavigationEvents.MoodTrackerClickedEvent:
        yield MoodTracker();
        break;
    }
  }

}