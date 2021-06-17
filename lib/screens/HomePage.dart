import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:provider/provider.dart';
import 'package:todo_assignment/controller/task_notifier.dart';
import 'package:todo_assignment/module/task.dart';
import 'package:todo_assignment/module/task_list.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime pickDate = DateTime.now();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String _taskName;
  String _details;

  @override
  Widget build(BuildContext context) {
    TaskNotifier taskNotifier = Provider.of<TaskNotifier>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Todo's App",
          style: TextStyle(
              fontSize: 25, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.orange,
      ),
      backgroundColor: Colors.blueGrey,
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Padding(padding: EdgeInsets.only(top: 10)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: 100,
                      child: Container(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          "Date:",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  SizedBox(
                    width: 250,
                    child: ListTile(
                      title: Text(
                          "${pickDate.day.toString()}-${pickDate.month.toString()}-${pickDate.year.toString()}"),
                      trailing: Icon(Icons.arrow_drop_down),
                      onTap: () {
                        showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2025))
                            .then((date) => pickDate = date);
                      },
                    ),
                  ),
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: 100,
                      child: Container(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          "Task:",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  SizedBox(
                    width: 250,
                    child: Container(
                      padding: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15.0)),
                      child: TextFormField(
                        onSaved: (String value) {
                          _taskName = value;
                        },
                        validator: (String value) {
                          if (value.isEmpty) {
                            return 'Task is required';
                          }

                          return null;
                        },
                        decoration: InputDecoration(
                            hintText: 'Task Name', border: InputBorder.none),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(padding: EdgeInsets.all(10)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                      width: 100,
                      child: Container(
                        padding: EdgeInsets.all(15),
                        child: Text(
                          "Details:",
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                      )),
                  SizedBox(
                    width: 250,
                    child: Container(
                        padding: EdgeInsets.only(left: 10),
                        height: 100,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.0)),
                        child: TextFormField(
                          onSaved: (String value) {
                            _details = value;
                          },
                          validator: (String value) {
                            if (value.isEmpty) {
                              return 'Details is required';
                            }

                            return null;
                          },
                          decoration: InputDecoration(
                              hintText: 'Enter Details',
                              border: InputBorder.none),
                        )),
                  ),
                ],
              ),
              Center(
                  child: Card(
                color: Colors.orange,
                margin: EdgeInsets.only(top: 25, left: 25.0, right: 25.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: ListTile(
                  onTap: () {
                    if (!_formKey.currentState.validate()) return;
                    _formKey.currentState.save();
                    taskNotifier.addTask(Task(
                        "${pickDate.day.toString()}-${pickDate.month.toString()}-${pickDate.year.toString()}",
                        _taskName,
                        _details));
                  },
                  title: Text("Save",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: 'serif',
                          fontSize: 25,
                          color: Colors.black,
                          fontWeight: FontWeight.bold)),
                ),
              )),
              SizedBox(height: 20),
              TaskList(),
            ],
          ),
        ),
      ),
    );
  }
}
