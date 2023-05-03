import 'package:flutter/material.dart';
import 'package:quizzion/Pages/MyHomePage.dart';
import 'package:quizzion/Pages/TodoPage.dart';
import 'package:quizzion/Widgets/ColourChanger.dart';
import 'package:quizzion/Widgets/Question.dart';

Map<String, WidgetBuilder> routes = {
  '/': (context) => const MyHomePage(),
  '/question': (context) => Question(),
  '/boardGen': (context) => const ColourChanger(),
  '/Todo': (context) => TodoPage()
};
