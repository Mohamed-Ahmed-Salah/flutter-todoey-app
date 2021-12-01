import 'package:flutter/foundation.dart';
import 'task.dart';

class TaskData extends ChangeNotifier {
  List<Task> task = [
    Task(name: 'a'),
    Task(name: 'b'),
    Task(name: 'c'),
  ];

  int get taskCount {
    return task.length;
  }

  void addTask(String newTask) {
    final ntask = Task(name: newTask);
    task.add(ntask);
    notifyListeners();
  }

  void checkBox(Task task) {
    task.toggleDone();
    notifyListeners();
  }


  void deleteTask(Task wtask) {
    task.remove(wtask);
    notifyListeners();
  }
}
