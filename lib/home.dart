import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:motivation/flash.dart';

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
            Align(
              alignment: Alignment(0, -0.1),
              child: Container(
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
              alignment: Alignment(0, 0.1),
              child: Container(
                child: MotiFlash(
                  child: Text(
                    'Tap screen to start'.toUpperCase(),
                    style: Theme.of(context).textTheme.overline,
                  ),
                  duration: const Duration(seconds: 3),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, 0.9),
              child: Container(
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
