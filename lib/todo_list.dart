import 'package:flutter/material.dart';

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  State<TodoList> createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  String todo = '';
  List<String> todos = [];
  final TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo'),
        leading: IconButton(
          onPressed: () {
            setState(() {
              todos = [];
            });
          },
          icon: const Icon(
            Icons.delete_outline,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    onChanged: (value) {
                      todo = value; //  <==
                    },
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      todos.add(todo);
                    });
                    controller.clear();
                  },
                  icon: const Icon(
                    Icons.add_circle_outline_sharp,
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                ),
                child: ListView.builder(
                  itemCount: todos.length,
                  itemBuilder: (context, index) {
                    return Text(todos[index]);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
