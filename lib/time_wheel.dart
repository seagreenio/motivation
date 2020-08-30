import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MotiTimeWheel extends StatefulWidget {
  final List<int> range;

  MotiTimeWheel({@required this.range});

  @override
  createState() => _MotiTimeState();
}

class _MotiTimeState extends State<MotiTimeWheel> {
  _onSelectedItemChanged(i) {
    HapticFeedback.vibrate();
  }

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: -1,
      child: ListWheelScrollView(
        children: widget.range
            .map(
              (d) => RotatedBox(
                quarterTurns: 1,
                child: Text(
                  d.toString(),
                  style: Theme.of(context)
                      .textTheme
                      .headline5
                      .copyWith(letterSpacing: 1.5),
                ),
              ),
            )
            .toList(),
        itemExtent: 96,
        onSelectedItemChanged: _onSelectedItemChanged,
      ),
    );
  }
}
