import 'package:flutter/material.dart';
import 'package:motivation/flash.dart';

class MotiGuidesStep3Preparing extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: MotiFlash(
            child: Text(
              'preparing'.toUpperCase(),
              style: Theme.of(context)
                  .textTheme
                  .button
                  .copyWith(letterSpacing: 1.5),
            ),
            duration: const Duration(
              seconds: 1,
            ),
          ),
        ),
      ],
    );
  }
}
