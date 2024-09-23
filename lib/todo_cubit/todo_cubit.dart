import 'package:bloc/bloc.dart';
import 'package:todo/models/todo_item.dart';
import 'package:todo/todo_cubit/todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit() : super(TodoInisialState());

  void addTask(String title) {
    if (state is AddRemoveTasksState) {
      final preTasks = (state as AddRemoveTasksState).tasks;
      final newTask = Todo(title: title);
      List<Todo> newList = List.from(preTasks)..add(newTask);
      emit(AddRemoveTasksState(newList));
    } else {
      emit(AddRemoveTasksState([]));
    }
  }

  // void addTask(String title) {
  //   final preTasks = (state is AddRemoveTasksState)
  //       ? (state as AddRemoveTasksState).tasks
  //       : [];

  //   final newTask = Todo(title: title);
  //   List<Todo> newList = List.from(preTasks)..add(newTask);
  //   emit(AddRemoveTasksState(newList));
  // }

  void deleteTask(int index) {
    final preTasks = (state as AddRemoveTasksState).tasks;
    List<Todo> updatedTasks = List.from(preTasks)..removeAt(index);
    emit(AddRemoveTasksState(updatedTasks));
  }

  void doneTask(int index, bool done) {
    final preTasks = (state as AddRemoveTasksState).tasks;

    preTasks[index].isDone = !preTasks[index].isDone;

    emit(AddRemoveTasksState(preTasks));
  }
}
