import 'dart:math';

import 'package:flutter/material.dart';
import 'Favourites.dart';

class ColourChanger extends StatefulWidget {
  const ColourChanger({Key? key}) : super(key: key);

  @override
  State<ColourChanger> createState() => ColourChangerState();
}

class ColourChangerState extends State<ColourChanger> {
  int max = 256;
  int min = 0;
  Random rng = Random();
  bool isExpanded = false;
  Color aColour = Colors.black12;

  int _r = 0;
  int _g = 0;
  int _b = 0;
  int totVal = 0;

  int checkRValue() {
    return _r + _g + _b;
  }

  @override
  void initState() {
    super.initState();
    isExpanded = true;
  }

  Color checkTotalValue() {
    if (_r + _g + _b <= 200) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  Color checkColour() {
    return aColour;
  }

  @override
  Widget build(BuildContext context) {
    _g = rng.nextInt(max);
    _r = rng.nextInt(max);
    _b = rng.nextInt(max);

    aColour = Color.fromRGBO(_r, _g, _b, 1);

    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        setState(() {});
      },
      onDoubleTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: AnimatedPadding(
        padding: EdgeInsets.all(isExpanded ? 10 : 100),
        duration: const Duration(milliseconds: 500),
        child: Card(
          color: aColour,
          child: Expanded(
            flex: 90,
            child: Column(
              children: [
                Text(checkRValue().toString(),
                    style: TextStyle(color: checkTotalValue())),
                Favourites(
                  colour: aColour,
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 150),
                  padding: const EdgeInsets.only(bottom: 50),
                  child: TextField(
                    textAlign: TextAlign.center,
                    controller: TextEditingController(
                      text: "Enter Board Name",
                    ),
                    style: TextStyle(
                      fontSize: 20,
                      color: checkTotalValue(),
                    ),
                  ),
                ),
                TextField(
                  controller: TextEditingController(text: '$_r'),
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.white),
                  onChanged: (value) {
                    setState(() {
                      _r = _r;
                    });
                  },
                ),
                TextField(
                  controller: TextEditingController(text: '$_g'),
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.white),
                  onChanged: (value) {
                    setState(() {
                      _g = _g;
                    });
                  },
                ),
                TextField(
                  controller: TextEditingController(text: '$_b'),
                  keyboardType: TextInputType.number,
                  style: const TextStyle(color: Colors.white),
                  onChanged: (value) {
                    setState(() {
                      _b = _b;
                    });
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
