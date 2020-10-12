import 'package:flutter/material.dart';
import 'package:day/day.dart';
import 'package:motivation/time_wheel.dart';

typedef void GoBackFn();

class MotiGuidesStep2 extends StatefulWidget {
  final GoBackFn go;
  final GoBackFn back;
  final Day birth;
  final setBirth;

  MotiGuidesStep2({
    @required this.go,
    @required this.birth,
    @required this.back,
    @required this.setBirth,
  });

  @override
  createState() => _MotiGuidesStep2State();
}

class _MotiGuidesStep2State extends State<MotiGuidesStep2>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<Offset> _offsetAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..forward();
    _offsetAnimation = Tween<Offset>(
      begin: const Offset(0, 0.15),
      end: Offset.zero,
    ).animate(CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position: _offsetAnimation,
      child: Stack(
        children: [
          Align(
            alignment:
                MediaQuery.of(context).orientation == Orientation.portrait
                    ? Alignment(0, -0.45)
                    : Alignment(0, -0.75),
            child: Text(
              'Choose your brith'.toUpperCase(),
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .headline6
                  .copyWith(letterSpacing: 1.5),
            ),
          ),
          Align(
            alignment:
                MediaQuery.of(context).orientation == Orientation.portrait
                    ? Alignment(0, 0)
                    : Alignment(0, 0.45),
            child: Container(
              height: 24.0 * 3 * 3,
              child: FractionallySizedBox(
                widthFactor:
                    MediaQuery.of(context).orientation == Orientation.portrait
                        ? 1
                        : 0.6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: MotiTimeWheel(
                        controller: FixedExtentScrollController(
                          initialItem: widget.birth.year() - 1900,
                        ),
                        range: List.generate(
                            Day().year() - 1900 + 1, (index) => index + 1900),
                        onSelectedItemChangedCallback: (range, i) =>
                            widget.setBirth('y', range[i]),
                      ),
                    ),
                    Expanded(
                      child: MotiTimeWheel(
                        controller: FixedExtentScrollController(
                          initialItem: widget.birth.month() - 1,
                        ),
                        range: List.generate(12, (index) => index + 1),
                        onSelectedItemChangedCallback: (range, i) =>
                            widget.setBirth('M', range[i]),
                      ),
                    ),
                    Expanded(
                      child: MotiTimeWheel(
                        controller: FixedExtentScrollController(
                          initialItem: widget.birth.date() - 1,
                        ),
                        range: List.generate(31, (index) => index + 1),
                        onSelectedItemChangedCallback: (range, i) =>
                            widget.setBirth('d', range[i]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(-0.9, -0.9),
            child: IconButton(
              icon: Icon(Icons.arrow_back),
              iconSize: 34,
              onPressed: widget.back,
            ),
          ),
          Align(
            alignment:
                MediaQuery.of(context).orientation == Orientation.portrait
                    ? Alignment(0, 0.75)
                    : Alignment(0.9, -0.9),
            child: IconButton(
              icon: Icon(Icons.check),
              iconSize: 34,
              onPressed: widget.go,
            ),
          ),
        ],
      ),
    );
  }
}
