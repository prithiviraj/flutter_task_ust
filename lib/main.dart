import 'package:flutter/material.dart';
import 'package:flutter_app/features/screen1/ui/Screen1.dart';
import 'constant/Constants.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: Constants.isDebugShowCheckedModeBanner,
      home: Screen1(),
    ),
  );
}
