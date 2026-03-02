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
  List<Todo> _todoList = [];

  @override
  void initState() {
    super.initState();
    // When we access this page, copy in the todos from the app state
    // They'll have already loaded in from firestore
    setState(() {
      _todoList = widget.appState.todos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: _todoList.length,
        itemBuilder: (context, index) {
          var todo = _todoList[index];
          // Dismissible allows us to swipe away the list items (delete)
          return Dismissible(
            key: UniqueKey(),
            child: ListTile(
              title: Text(
                todo.description,
                style: TextStyle(
                  decoration: todo.isComplete
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                ),
              ),
              trailing: Checkbox(
                value: todo.isComplete,
                onChanged: (value) {
                  setState(() {
                    // Update local statec
                    todo.isComplete = value!;
                    // Update backend
                    widget.appState.updateTodo(todo);
                  });
                },
              ),
            ),
            onDismissed: (direction) {
              // Direction is either left or right (in our case we don't care)
              setState(() {
                // Update local state
                _todoList.removeAt(index);
                // Update backend
                widget.appState.deleteTodo(todo);
              });
            },
          );
        },
      ),
    );
  }
}
