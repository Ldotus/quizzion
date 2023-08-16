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
  Random rng = Random(); // Random number generator for RGB values
  bool isExpanded = false; // Flag to track the expanded state of the card
  Color aColour = Colors.black12; // Initial color for the card

  int _r = 0; // Red component of the color
  int _g = 0; // Green component of the color
  int _b = 0; // Blue component of the color
  int totVal = 0; // Total value of R, G, and B components

  // Calculate the sum of R, G, and B components
  int checkRValue() {
    return _r + _g + _b;
  }

  @override
  void initState() {
    super.initState();
    isExpanded = true; // Set the card initially expanded
  }

  // Check the total value of R, G, and B to determine text color
  Color checkTotalValue() {
    if (_r + _g + _b <= 200) {
      return Colors.white;
    } else {
      return Colors.black;
    }
  }

  // Get the current color of the card
  Color checkColour() {
    return aColour;
  }

  @override
  Widget build(BuildContext context) {
    // Generate random R, G, and B values for the color
    _g = rng.nextInt(max);
    _r = rng.nextInt(max);
    _b = rng.nextInt(max);

    // Create a Color object using the random R, G, and B values
    aColour = Color.fromRGBO(_r, _g, _b, 1);

    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        setState(() {}); // Trigger a rebuild when the user drags horizontally
      },
      onDoubleTap: () {
        setState(() {
          isExpanded = !isExpanded; // Toggle the expansion state on double-tap
        });
      },
      child: Card(
        color: aColour, // Set the background color of the card
        child: Column(
          children: [
            Text(
              checkRValue().toString(), // Display the sum of R, G, and B
              style: TextStyle(
                  color: checkTotalValue()), // Set text color based on the sum
            ),
            Favourites(
                colour: aColour), // A custom widget with a color passed to it
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
                  color: checkTotalValue(), // Set text color based on the sum
                ),
              ),
            ),
            TextField(
              controller: TextEditingController(text: '$_r'),
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.white),
              onChanged: (value) {
                setState(() {
                  _r = int.tryParse(value) ??
                      _r; // Update the red component from the TextField
                });
              },
            ),
            TextField(
              controller: TextEditingController(text: '$_g'),
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.white),
              onChanged: (value) {
                setState(() {
                  _g = int.tryParse(value) ??
                      _g; // Update the green component from the TextField
                });
              },
            ),
            TextField(
              controller: TextEditingController(text: '$_b'),
              keyboardType: TextInputType.number,
              style: const TextStyle(color: Colors.white),
              onChanged: (value) {
                setState(() {
                  _b = int.tryParse(value) ??
                      _b; // Update the blue component from the TextField
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
