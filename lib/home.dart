import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:motivation/flash.dart';

class MotiHome extends StatefulWidget {
  @override
  _MotiHomeState createState() => _MotiHomeState();
}

class _MotiHomeState extends State<MotiHome> {
  bool _started = false;

  getStarted() {
    HapticFeedback.vibrate();

    setState(() {
      _started = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    updateStatusBarByCurrentTheme(context);

    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: getStarted,
          child: Stack(
            children: [
              AnimatedContainer(
                duration: const Duration(
                  milliseconds: 600,
                ),
                alignment: _started
                    ? MediaQuery.of(context).orientation == Orientation.portrait
                        ? Alignment(0, -0.45)
                        : Alignment(0, -0.75)
                    : Alignment(0, -0.15),
                child: Text(
                  'Motivation'.toUpperCase(),
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(letterSpacing: 4.5),
                ),
              ),
              if (!_started)
                Center(
                  child: MotiFlash(
                    child: Text(
                      'Tap screen to start'.toUpperCase(),
                      style: Theme.of(context).textTheme.overline,
                    ),
                    duration: const Duration(seconds: 3),
                  ),
                ),
              Align(
                alignment: Alignment(0, 0.9),
                child: Text(
                  'Optimize Your Time'.toUpperCase(),
                  style: Theme.of(context).textTheme.overline,
                ),
              ),
            ],
          ),
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
