import 'dart:math';

import 'package:flutter/material.dart';

class ColourChanger extends StatefulWidget {
  const ColourChanger({Key? key}) : super(key: key);

  @override
  State<ColourChanger> createState() => ColourChangerState();
}

class ColourChangerState extends State<ColourChanger> {
  int max = 256;
  int min = 0;
  Random rng = Random();

  int _r = 0;
  int _g = 0;
  int _b = 0;

  int checkRValue() {
    return _r + _g + _b;
  }

  @override
  Widget build(BuildContext context) {
    _g = rng.nextInt(max);
    _r = rng.nextInt(max);
    _b = rng.nextInt(max);

    Color aColour = Color.fromRGBO(_r, _g, _b, 1);

    return Card(
      color: aColour,
      child: Column(
        children: [
          Text(checkRValue().toString()),
          TextField(
            controller: TextEditingController(text: '$_r'),
            keyboardType: TextInputType.number,
            style: const TextStyle(color: Colors.white),
            onChanged: (value) {
              setState(() {
                _r = int.tryParse(value) ?? 0;
              });
            },
          ),
          TextField(
            controller: TextEditingController(text: '$_g'),
            keyboardType: TextInputType.number,
            style: const TextStyle(color: Colors.white),
            onChanged: (value) {
              setState(() {
                _g = int.tryParse(value) ?? 0;
              });
            },
          ),
          TextField(
            controller: TextEditingController(text: '$_b'),
            keyboardType: TextInputType.number,
            style: const TextStyle(color: Colors.white),
            onChanged: (value) {
              setState(() {
                _b = int.tryParse(value) ?? 0;
              });
            },
          ),
        ],
      ),
    );
  }
}
