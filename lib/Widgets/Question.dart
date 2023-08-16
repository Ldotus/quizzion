import 'package:flutter/material.dart';

@override
class Question extends StatelessWidget {
  const Question({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      child: Row(children: [
        TextButton(
          onPressed: () {},
          child: const Text("data"),
        ),
        TextButton(
          onPressed: () {},
          child: const Text("data2"),
        ),
        TextButton(
          onPressed: () {},
          child: const Text("data3"),
        ),
      ]),
    );
  }
}
