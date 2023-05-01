import 'package:flutter/material.dart';
import 'package:quizzion/Pages/MyHomePage.dart';
import 'package:quizzion/Pages/TodoPage.dart';
import 'package:quizzion/Widgets/ColourChanger.dart';

Map<String, WidgetBuilder> routes = {
  '/': (context) => const MyHomePage(),
  '/boardGen': (context) => const ColourChanger(),
  '/Todo': (context) => TodoPage(),
};
