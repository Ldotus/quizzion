import 'package:flutter/material.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => TodoPageState();
}

class TodoPageState extends State<TodoPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
        body: SizedBox(
      height: 350,
      width: 200,
      child: Card(
        child: Column(children: [
          TextButton(onPressed: null, child: Text("Child")),
          TextButton(onPressed: null, child: Text("Child2")),
          TextButton(onPressed: null, child: Text("Child3")),
        ]),
      ),
    ));
  }
}
