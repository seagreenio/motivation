import 'package:flutter/material.dart';

class MotiFlash extends StatefulWidget {
  final Widget child;
  final Duration duration;

  MotiFlash({@required this.child, @required this.duration});

  @override
  createState() => _MotiFlashState();
}

class _MotiFlashState extends State<MotiFlash>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
    )..repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _controller,
      child: widget.child,
    );
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }
}
