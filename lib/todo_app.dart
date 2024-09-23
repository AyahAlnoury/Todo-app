import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/todo_cubit/todo_cubit.dart';
import 'package:todo/todo_cubit/todo_state.dart';
import 'package:todo/widgets/todo_item.dart';

class TodoAppWithoutStateManagement extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void _toggleTodoStatus(int index, bool done) {
      context.read<TodoCubit>().doneTask(index, done);
      // setState(() {
      //_todos[index].isDone = !_todos[index].isDone;
    }

    addTaskkk(String title) {
      context.read<TodoCubit>()..addTask(title);
    }

    void _showAddTodoDialog() {
      final _titleController = TextEditingController();
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text("Add New Task"),
          content: TextField(
            controller: _titleController,
            decoration: const InputDecoration(labelText: "Task Title"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                addTaskkk(_titleController.text);

                Navigator.pop(context);
                print(_titleController.text);
              },
              child: const Text("Save"),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Tasks'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: BlocBuilder<TodoCubit, TodoState>(
        builder: (context, state) {
          if (state is TodoInisialState) {
            return const Center(child: Text('No Tasks Available'));
          } else if (state is AddRemoveTasksState) {
            return ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: state.tasks.length,
              itemBuilder: (context, index) {
                final todo = state.tasks[index];
                return TodoItem(
                  title: todo.title,
                  isDone: todo.isDone,
                  onDelete: () {
                    return context.read<TodoCubit>().deleteTask(index);
                  },
                  onToggled: (value) {
                    return _toggleTodoStatus(index, todo.isDone);
                  },
                );
              },
            );
          }
          return Text("nodata");
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddTodoDialog,
        backgroundColor: Colors.teal,
        child: const Icon(Icons.add),
      ),
    );
  }
}
