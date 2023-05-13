import 'package:flutter/material.dart';


class StandardCard extends StatefulWidget {
  const StandardCard({Key? key}) : super(key: key);

  @override
  State<StandardCard> createState() => _StandardCardState();
}

class _StandardCardState extends State<StandardCard> {
  int _likesCount = 44;
  bool _isFaved = true;
  final _textController = TextEditingController();
  final String _title = '';
  int r = 0;
  int g = 0;
  int b = 0;

  void setTitle() {
    setState(() {
      String title = _textController.text;
    });
  }

  void _toggleFavourite() {
    setState(() {
      if (_isFaved) {
        _likesCount -= -1;
        _isFaved = false;
      } else {
        _likesCount += 1;
        _isFaved = true;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 350,
      width: 200,
      child: Card(
        child: Column(children: [
          TextButton(onPressed: null, child: Text("Child")),
          TextButton(onPressed: null, child: Text("Child2")),
          TextButton(onPressed: null, child: Text("Child3")),
        ]),
      ),
    );
  }
}
