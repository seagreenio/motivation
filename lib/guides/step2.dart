import 'package:flutter/material.dart';

class MotiGuidesStep2 extends StatefulWidget {
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
            child: FractionallySizedBox(
              widthFactor: 0.75,
              child: Text(
                'Now choose the year of your brith'.toUpperCase(),
                textAlign: TextAlign.center,
                style: Theme.of(context)
                    .textTheme
                    .headline5
                    .copyWith(letterSpacing: 1.5),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
