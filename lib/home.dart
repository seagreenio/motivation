import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:day/day.dart';
import 'package:motivation/guides/step1.dart';
import 'package:motivation/guides/step2_choose_birth.dart';

class MotiHome extends StatefulWidget {
  @override
  _MotiHomeState createState() => _MotiHomeState();
}

class _MotiHomeState extends State<MotiHome> {
  int _step = 0;
  Widget _stepWidget = MotiGuidesStep1();
  Day _birth = Day.fromString('2000-01-01');

  _go() {
    HapticFeedback.vibrate();

    switch (_step) {
      case 0:
        setState(() {
          _stepWidget = MotiGuidesStep2(
            go: _go,
            back: _back,
            birth: _birth,
            setBirth: _setBirth,
          );
        });
        break;
      default:
        return;
    }

    setState(() => _step += 1);
  }

  _back() {
    HapticFeedback.vibrate();

    switch (_step) {
      case 1:
        setState(() {
          _stepWidget = MotiGuidesStep1();
        });
        break;
      case 2:
        setState(() {
          _stepWidget = MotiGuidesStep2(
            go: _go,
            back: _back,
            birth: _birth,
            setBirth: _setBirth,
          );
        });
        break;
      default:
        return;
    }

    setState(() => _step -= 1);
  }

  _setBirth(String unit, int val) {
    setState(
      () => _birth
        ..set(unit, val)
        ..finished(),
    );
  }

  @override
  Widget build(BuildContext context) {
    updateStatusBarByCurrentTheme(context);

    return Scaffold(
      body: SafeArea(
        child: GestureDetector(
          behavior: HitTestBehavior.translucent,
          onTap: _step == 0 ? _go : null,
          child: Stack(
            children: [
              AnimatedSwitcher(
                child: _stepWidget,
                switchInCurve: Curves.easeInOut,
                switchOutCurve: Curves.easeInOut,
                duration: const Duration(milliseconds: 500),
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
