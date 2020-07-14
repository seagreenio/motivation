import 'package:flutter/material.dart';

class MotiHome extends StatefulWidget {
  @override
  _MotiHomeState createState() => _MotiHomeState();
}

class _MotiHomeState extends State<MotiHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Text("Motivation"),
        ),
      ),
    );
  }
}
