import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

typedef void OnSelectedItemChangedCallbackFn(List<int> range, int i);

class MotiTimeWheel extends StatefulWidget {
  final List<int> range;
  final ScrollController controller;
  final OnSelectedItemChangedCallbackFn onSelectedItemChangedCallback;

  MotiTimeWheel({
    @required this.range,
    this.controller,
    this.onSelectedItemChangedCallback,
  });

  @override
  createState() => _MotiTimeState();
}

class _MotiTimeState extends State<MotiTimeWheel> {
  int _selectedIndex;

  _onSelectedItemChanged(i) {
    HapticFeedback.vibrate();

    setState(() => _selectedIndex = i);

    widget.onSelectedItemChangedCallback(widget.range, i);
  }

  @override
  Widget build(BuildContext context) {
    final _style =
        Theme.of(context).textTheme.headline5.copyWith(letterSpacing: 1.5);
    final _selectedStyle = Theme.of(context).textTheme.headline5.copyWith(
          fontSize: 28,
          fontWeight: FontWeight.bold,
          letterSpacing: 1.5,
        );

    return ListWheelScrollView.useDelegate(
      controller: widget.controller,
      childDelegate: ListWheelChildLoopingListDelegate(
        children: List<Widget>.generate(
          widget.range.length,
          (index) => AnimatedDefaultTextStyle(
            child: Text(
              widget.range[index].toString(),
            ),
            style: index == _selectedIndex ? _selectedStyle : _style,
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 250),
          ),
        ),
      ),
      itemExtent: _style.fontSize * 3,
      onSelectedItemChanged: _onSelectedItemChanged,
    );
  }
}
