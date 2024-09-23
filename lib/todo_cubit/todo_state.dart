import 'package:todo/models/todo_item.dart';

abstract class TodoState {}

class TodoInisialState extends TodoState {}

class AddRemoveTasksState extends TodoState {
  List<Todo> tasks = [];
  AddRemoveTasksState(this.tasks);
}
