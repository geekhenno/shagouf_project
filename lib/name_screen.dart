import 'package:flutter/material.dart';

class NameScreen extends StatelessWidget {
  final String name;
  const NameScreen({required this.name, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
      ),
      body: Center(
        child: Text(
          name,
          style: const TextStyle(
            fontSize: 40,
            color: Colors.blue,
          ),
        ),
      ),
    );
  }
}
