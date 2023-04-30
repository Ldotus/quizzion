import 'package:flutter/material.dart';
import 'package:quizzion/Widgets/ColourChanger.dart';
import 'package:quizzion/Widgets/StandardCard.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Card> _cardList = [];
  List<ColourChanger> _list = [];

  Widget createCard(ColourChanger cardList) {
    return const ColourChanger();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text("GenABoard"),
            leading: const Icon(Icons.safety_check),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text("Total: ${_list.length}"),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {
                          if (_list.isNotEmpty) {
                            // _cardList.remove(_cardList[1]);
                            _list.removeLast();
                          }
                        });
                      },
                      child: const Icon(Icons.arrow_back),
                    ),
                    ElevatedButton(
                        child: const Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            _list.add(const ColourChanger());
                          });
                        }),
                  ],
                ),
                ListView.builder(
                    shrinkWrap: true,
                    controller: ScrollController(keepScrollOffset: true),
                    itemCount: _list.length,
                    itemBuilder: (BuildContext context, int index) {
                      return createCard(_list[index]);
                    })
              ],
            ),
          )),
    );
  }
}
