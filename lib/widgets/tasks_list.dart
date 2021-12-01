import 'package:flutter/material.dart';
import 'package:todoey_flutter/widgets/tasks_tiles.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_dat.dart';

class TasksList extends StatefulWidget {
  //TasksList({ this.task,this.callbacklongPree});

  @override
  State<TasksList> createState() => _TasksListState();
}

class _TasksListState extends State<TasksList> {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return Dismissible(
              direction: DismissDirection.endToStart,
              key: UniqueKey(),
              background: buildSwipeActionRight(),
              onDismissed: (direction) {
                var xxx=taskData.task[index].name;
                // Remove the item from the data source.
                /*setState(() {
                  items.removeAt(index);
                });*/
              /*  print(index);
                print(index);
                print(taskData.task[index].name);*/
                taskData.deleteTask(taskData.task[index]);

                // Then show a snackbar.
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  duration: Duration(milliseconds: 500),
                    content: Text('${xxx} dismissed')));
              },
              child: TaskTile(
                  longPress: () {
                    setState(() {
                      //  taskData.task.remove(index);
                    });

                    print('aaaaaaaaa');
                  },
                  isChecked: taskData.task[index].isDone,
                  taskTitle: taskData.task[index].name,
                  checkBoxCallbakc: (newValue) {
                    taskData.checkBox(taskData.task[index]);
                  }),
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }

  Widget buildSwipeActionRight() => Container(
        alignment: Alignment.centerRight,
        padding: EdgeInsets.symmetric(horizontal: 20),
        color: Colors.red.shade400,
        child: Icon(
          Icons.delete_forever,
          color: Colors.white,
        ),
      );
}
