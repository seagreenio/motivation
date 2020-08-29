import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:motivation/guides/step1.dart';
import 'package:motivation/guides/step2.dart';

class MotiHome extends StatefulWidget {
  @override
  _MotiHomeState createState() => _MotiHomeState();
}

class _MotiHomeState extends State<MotiHome> {
  int _step = 1;
  Widget _stepWidget = MotiGuidesStep1();

  go() {
    HapticFeedback.vibrate();

    switch (_step) {
      case 1:
        setState(() {
          _stepWidget = MotiGuidesStep2();
        });
        break;
      default:
        return;
    }

    setState(() {
      _step += 1;
    });
  }

  back() {
    HapticFeedback.vibrate();

    switch (_step) {
      case 2:
        setState(() {
          _stepWidget = MotiGuidesStep1();
        });
        break;
      default:
        return;
    }

    setState(() {
      _step -= 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    updateStatusBarByCurrentTheme(context);

    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
            behavior: HitTestBehavior.translucent,
            onTap: go,
            child: Stack(
              children: [
                AnimatedSwitcher(
                  child: _stepWidget,
                  switchInCurve: Curves.easeInOut,
                  switchOutCurve: Curves.easeInOut,
                  duration: const Duration(milliseconds: 500),
                ),
                Align(
                  alignment: Alignment(0, 0.9),
                  child: _step == 1
                      ? Text(
                          'Optimize Your Time'.toUpperCase(),
                          style: Theme.of(context).textTheme.overline,
                        )
                      : Ink(
                          decoration: ShapeDecoration(
                              shape: CircleBorder(),
                              color:
                                  MediaQuery.of(context).platformBrightness ==
                                          Brightness.light
                                      ? Colors.black
                                      : Colors.white),
                          child: IconButton(
                            icon: Icon(Icons.chevron_left),
                            color: MediaQuery.of(context).platformBrightness ==
                                    Brightness.light
                                ? Colors.white
                                : Colors.black,
                            onPressed: back,
                          ),
                        ),
                ),
              ],
            )),
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
