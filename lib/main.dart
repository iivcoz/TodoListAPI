import 'package:flutter/material.dart';
import 'package:todo_list_api/todo_list_api/ui/todo_list_app.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo API List',
      debugShowCheckedModeBanner: false,
      home: TodoListApp(),
    );
  }
}
