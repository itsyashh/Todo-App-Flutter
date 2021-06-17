import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_assignment/controller/task_notifier.dart';

class TaskList extends StatelessWidget {
  TaskList();

  @override
  Widget build(BuildContext context) {
    TaskNotifier taskNotifier = Provider.of<TaskNotifier>(context);

    return ListView.builder(
      shrinkWrap: true,
      itemBuilder: (BuildContext context, int index) => Card(
          color: Colors.white,
          elevation: 5.0,
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Consumer<TaskNotifier>(
                      builder: (
                        _,
                        notifier,
                        __,
                      ) =>
                          Text(
                        '${notifier.taskList[index].taskName}',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 50)),
                    Consumer<TaskNotifier>(
                      builder: (
                        _,
                        notifier,
                        __,
                      ) =>
                          Text(
                        '${notifier.taskList[index].date}',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
                Consumer<TaskNotifier>(
                  builder: (
                    _,
                    notifier,
                    __,
                  ) =>
                      IconButton(
                          icon: Icon(Icons.radio_button_unchecked_sharp),
                          color: Colors.orange,
                          onPressed: () => notifier.deleteTask(index)),
                )
              ],
            ),
          )),
      itemCount: taskNotifier.taskList.length,
    );
  }
}
