import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/todo_app.dart';
import 'package:todo/todo_cubit/todo_cubit.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        create: (context) => TodoCubit(),
        child: TodoAppWithoutStateManagement(),
      ),
      theme: ThemeData(primarySwatch: Colors.teal),
    ));
