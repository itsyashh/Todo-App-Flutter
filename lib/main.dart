import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_assignment/controller/task_notifier.dart';
import 'package:todo_assignment/screens/HomePage.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => TaskNotifier(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: HomePage());
  }
}
