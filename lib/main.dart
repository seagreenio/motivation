import 'package:flutter/material.dart';
import 'package:motivation/home.dart';

void main() => runApp(Moti());

class Moti extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final lightTheme = ThemeData.light();
    final darkTheme = ThemeData.dark();

    return MaterialApp(
      title: 'Motivation',
      theme: lightTheme,
      darkTheme: darkTheme,
      home: MotiHome(),
      debugShowCheckedModeBanner: false,
    );
  }
}
