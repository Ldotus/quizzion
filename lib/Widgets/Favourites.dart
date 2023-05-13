import 'package:flutter/material.dart';
import 'package:quizzion/Widgets/ColourChanger.dart';

class Favourites extends StatefulWidget {
  Color colour;

  Favourites({Key? key, required this.colour}) : super(key: key);

  @override
  State<Favourites> createState() => FavouritesState();
}

class FavouritesState extends State<Favourites> {
  final ColourChangerState ccs = ColourChangerState();
  bool isFaved = false;
  bool addToBox = false;

  int faveCount = 25;
  String colour = "";
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.only(bottom: 20),
          color: widget.colour,
          child: IconButton(
            padding: const EdgeInsets.only(bottom: 60),
            icon: (addToBox
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border)),
            color: ccs.checkTotalValue(),
            onPressed: _addToBox,
          ),
        ),
        SizedBox(
          width: 40,
          height: 40,
          child: SizedBox(child: Text('$faveCount')),
        )
      ],
    );
  }

  void _addToBox() {
    setState(() {
      if (!addToBox) {
        colour = widget.colour.toString();
        print(colour);
      } else {
        print("Default");
      }
      addToBox = !addToBox;
    });
  }
}
