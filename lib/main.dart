import 'package:flutter/material.dart';
import 'package:shagouf_project/home.dart';
import 'package:shagouf_project/todo_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String username = '';
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "Flutter",
      home: TodoList(),
    );
  }
}
