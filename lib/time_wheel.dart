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

  @override
  void initState() {
    super.initState();

    setState(() {
      if (widget.controller != null &&
          widget.controller is FixedExtentScrollController) {
        _selectedIndex =
            (widget.controller as FixedExtentScrollController).initialItem;
      }
    });
  }

  _onSelectedItemChanged(i) {
    HapticFeedback.vibrate();

    setState(() => _selectedIndex = i);
    widget.onSelectedItemChangedCallback(widget.range, i);
  }

  @override
  Widget build(BuildContext context) {
    final _selectedStyle = Theme.of(context).textTheme.headline5.copyWith(
          fontSize: 28,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.5,
        );
    final _style1 = Theme.of(context)
        .textTheme
        .headline5
        .copyWith(color: Colors.black45, letterSpacing: 1.5);
    final _style2 = Theme.of(context)
        .textTheme
        .headline5
        .copyWith(color: Colors.black26, letterSpacing: 1.5);

    return ListWheelScrollView.useDelegate(
      controller: widget.controller,
      physics: FixedExtentScrollPhysics(),
      childDelegate: ListWheelChildLoopingListDelegate(
        children: List<Widget>.generate(
          widget.range.length,
          (index) => AnimatedDefaultTextStyle(
            child: Text(
              widget.range[index].toString(),
            ),
            style: index == _selectedIndex
                ? _selectedStyle
                : (index == _selectedIndex + 1 || index == _selectedIndex - 1)
                    ? _style1
                    : _style2,
            curve: Curves.easeInOut,
            duration: const Duration(milliseconds: 250),
          ),
        ),
      ),
      itemExtent: _style1.fontSize * 3,
      onSelectedItemChanged: _onSelectedItemChanged,
    );
  }
}
