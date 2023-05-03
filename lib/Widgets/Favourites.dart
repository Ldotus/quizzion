import 'package:flutter/material.dart';
import 'package:quizzion/Widgets/ColourChanger.dart';

class Favourites extends StatefulWidget {
  Color colour;

  Favourites({Key? key, required this.colour}) : super(key: key);

  @override
  State<Favourites> createState() => FavouritesState();
}

class FavouritesState extends State<Favourites> {
  bool isFaved = false;
  int faveCount = 9;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          padding: const EdgeInsets.all(5),
          color: widget.colour,
          child: IconButton(
            padding: const EdgeInsets.only(right: 10),
            icon: (isFaved
                ? const Icon(Icons.star)
                : const Icon(Icons.star_border)),
            onPressed: _toggleFave,
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

  void _toggleFave() {
    setState(() {
      if (!isFaved) {
        faveCount++;
      } else {
        faveCount--;
      }
      isFaved = !isFaved;
    });
  }
}
