import 'package:flutter/material.dart';
import 'package:motivation/flash.dart';

class MotiGuidesStep1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment(0, -0.15),
          child: Text(
            'Motivation'.toUpperCase(),
            style: Theme.of(context)
                .textTheme
                .headline5
                .copyWith(letterSpacing: 4.5),
          ),
        ),
        Center(
          child: MotiFlash(
            child: Text(
              'Tap screen to start'.toUpperCase(),
              style: Theme.of(context).textTheme.button,
            ),
            duration: const Duration(
              seconds: 1,
            ),
          ),
        ),
        Align(
          alignment: Alignment(0, 0.75),
          child: Text(
            'Optimize Your Time'.toUpperCase(),
            style: Theme.of(context).textTheme.overline,
          ),
        ),
      ],
    );
  }
}
