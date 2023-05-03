import 'package:flutter/material.dart';
import 'package:quizzion/Pages/TodoPage.dart';
import 'package:quizzion/Widgets/ColourChanger.dart';
import 'package:quizzion/Widgets/StandardCard.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Declare two empty lists to hold Card and ColourChanger widgets

  List<ColourChanger> _list = [];

  // Create a new Card widget using a given ColourChanger widget
  Widget createCard(ColourChanger cardList) {
    return const ColourChanger();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GenABoard"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Display the total number of ColourChanger widgets
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("Total: ${_list.length}"),
                ElevatedButton(
                  onPressed: () {
                    setState(() {
                      if (_list.isNotEmpty) {
                        // Remove the last ColourChanger widget from the list
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
                        // Add a new ColourChanger widget to the list
                        _list.add(const ColourChanger());
                      });
                    }),
              ],
            ),
            // Display a ListView of all the ColourChanger widgets
            ListView.builder(
                shrinkWrap: true,
                controller: ScrollController(keepScrollOffset: true),
                itemCount: _list.length,
                itemBuilder: (BuildContext context, int index) {
                  return createCard(_list[index]);
                })
          ],
        ),
      ),
      drawer: Drawer(
          child: ListView(
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.red,
            ),
            padding: EdgeInsets.all(50),
            child: Text("GenaBoard"),
          ),
          ListTile(
            title: const Text("Tile1"),
            onTap: () {
              Navigator.pushNamed(context, '/question');
            },
          )
        ],
      )),
    );
  }
}
