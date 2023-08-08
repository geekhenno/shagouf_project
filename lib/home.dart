import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shagouf_project/name_screen.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String input = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Home',
          style: TextStyle(
            color: Colors.yellow,
          ),
        ),
        backgroundColor: Colors.purple,
        elevation: 0,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              onChanged: (String value) {
                input = value;
              },
            ),
            CupertinoButton(
              child: const Text(
                'Next',
                style: TextStyle(fontSize: 40),
              ),
              onPressed: () {
                if (input.length >= 3) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          NameScreen(name: input),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Your name should be at least 3 chars'),
                      backgroundColor: Colors.purple,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
