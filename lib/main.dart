import 'package:flutter/material.dart';
import 'package:quizzion/Pages/Routes.dart';

void main() => runApp(const MaterialApp(
      home: _myForm(),
    ));

//create class that defines the widget
class _myForm extends StatefulWidget {
  const _myForm({Key? key}) : super(key: key);
//create method to return the state for the form

  @override
  _myFormState createState() {
    return _myFormState();
  }
}

//create a state class that extends state
class _myFormState extends State<_myForm> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Remme: Genesis-tant",
      routes: routes,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.pink,
        appBarTheme: const AppBarTheme(
            backgroundColor: Colors.lightGreen,
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.elliptical(4, 50),
              ),
            )),
      ),
    );
  }
}
