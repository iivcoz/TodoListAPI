import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:todo_list_api/todo_list_api/model/todo_list_app.dart';
import 'package:todo_list_api/todo_list_api/ui/todo_list_app.dart';

import '../model/todo_list_app.dart';

class TodoListApp extends StatefulWidget {
  const TodoListApp({super.key});

  @override
  State<TodoListApp> createState() => _TodoListAppState();
}

class _TodoListAppState extends State<TodoListApp> {
  List<Todo> todos = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo List API'),
        backgroundColor: Colors.blue[300],
        centerTitle: true,
        elevation: 5,
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            title: Text('Title:${todos[index].title}'),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('User ID: ${todos[index].userId}'),
                Text('ID: ${todos[index].id}'),
                Text('Completed: ${todos[index].completed}'),
              ],
            ),
          );
        },
      ),
    );
  }

  Future<List<Todo>> fetchTodos() async {
    final response =
        await http.get(Uri.parse('https://jsonplaceholder.typicode.com/todos'));

    if (response.statusCode == 200) {
      List<dynamic> body = jsonDecode(response.body);
      List<Todo> todos =
          body.map((dynamic item) => Todo.fromJson(item)).toList();
      return todos;
    } else {
      throw "Failed to load todos";
    }
  }

  @override
  void initState() {
    super.initState();
    fetchTodos().then((value) {
      setState(() {
        todos.addAll(value);
      });
    });
  }
}
