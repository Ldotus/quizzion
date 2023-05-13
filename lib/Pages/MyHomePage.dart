import 'package:flutter/material.dart';
import 'package:quizzion/Widgets/ColourChanger.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Declare two empty lists to hold Card and ColourChanger widgets

  final List<ColourChanger> _list = [];

  final TextEditingController ColourController = TextEditingController();

  late ColourLabel? selectedColour;

  // Create a new Card widget using a given ColourChanger widget
  Widget createCard(ColourChanger cardList) {
    return const ColourChanger();
  }

  @override
  Widget build(BuildContext context) {
    final List<DropdownMenuEntry<ColourLabel>> colourEntries =
        <DropdownMenuEntry<ColourLabel>>[];
    for (final ColourLabel color in ColourLabel.values) {
      colourEntries.add(DropdownMenuEntry<ColourLabel>(
          value: color, label: color.label, enabled: color.label != 'grey'));
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("GenABoard"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Display the total number of ColourChanger widgets
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  DropdownMenu<ColourLabel>(
                    dropdownMenuEntries: colourEntries,
                    controller: ColourController,
                    enableFilter: false,
                    label: const Text('Colour'),
                    onSelected: (ColourLabel? colour) {
                      setState(() {
                        selectedColour = colour;
                      });
                    },
                  ),
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
                    child: const Icon(Icons.remove_circle),
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

enum ColourLabel {
  blue('blue', Colors.blue),
  red('red', Colors.red),
  orange('orange', Colors.orange),
  black('black', Colors.black),
  white('white', Colors.white);

  const ColourLabel(this.label, this.colour);
  final String label;
  final Color colour;
}
