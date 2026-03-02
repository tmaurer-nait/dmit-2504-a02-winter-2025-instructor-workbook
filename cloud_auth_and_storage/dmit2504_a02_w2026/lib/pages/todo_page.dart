import 'package:flutter/material.dart';
import 'package:dmit2504_a02_w2026/models/todo.dart';
import 'package:dmit2504_a02_w2026/state/app_state.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({required this.appState, super.key});

  final AppState appState;

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  List<Todo> _todoList = [
    Todo(description: 'Complete assignment 3', isComplete: true),
    Todo(description: 'Plan Project Proposal', isComplete: false),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: _todoList.length,
        itemBuilder: (context, index) {
          var todo = _todoList[index];
          return ListTile(title: Text(todo.description));
        },
      ),
    );
  }
}
