import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MotiHome extends StatefulWidget {
  @override
  _MotiHomeState createState() => _MotiHomeState();
}

class _MotiHomeState extends State<MotiHome> {
  @override
  Widget build(BuildContext context) {
    updateStatusBarByCurrentTheme(context);

    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: Container(
                margin: EdgeInsets.only(
                  bottom: 72,
                ),
                child: Text(
                  'Motivation'.toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(letterSpacing: 4.5),
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: EdgeInsets.only(
                  bottom: 24,
                ),
                child: Text(
                  'Optimize Your Time'.toUpperCase(),
                  style: Theme.of(context).textTheme.overline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void updateStatusBarByCurrentTheme(BuildContext context) {
  final brightness = MediaQuery.of(context).platformBrightness;

  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ).copyWith(
      statusBarIconBrightness:
          brightness == Brightness.light ? Brightness.dark : Brightness.light,
    ),
  );
}
