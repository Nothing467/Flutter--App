import 'package:flutter/material.dart';

final ThemeData appTheme = ThemeData(
  primarySwatch: Colors.blue,
  visualDensity: VisualDensity.adaptivePlatformDensity,
  textTheme: TextTheme(
    headline1: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
    bodyText1: TextStyle(fontSize: 16),
  ),
);
