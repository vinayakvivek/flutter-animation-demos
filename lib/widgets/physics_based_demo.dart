import 'package:animation_test/helpers/custom_scaffold.dart';
import 'package:flutter/material.dart';

class PhysicsBasedAnimationDemo extends StatefulWidget {
  @override
  _PhysicsBasedAnimationDemoState createState() =>
      _PhysicsBasedAnimationDemoState();
}

class _PhysicsBasedAnimationDemoState extends State<PhysicsBasedAnimationDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Alignment _dragAlignment = Alignment.center;
  Animation<Alignment> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    _controller.addListener(() {
      setState(() {
        _dragAlignment = _animation.value;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _runAnimation() {
    _animation = _controller.drive(
      AlignmentTween(
        begin: _dragAlignment,
        end: Alignment.center,
      ),
    );
    _controller.reset();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return CustomScaffold(
      title: 'Physics based',
      body: GestureDetector(
        onPanDown: (details) => _controller.stop(),
        onPanUpdate: (details) {
          setState(() {
            _dragAlignment += Alignment(
              details.delta.dx / (size.width / 2),
              details.delta.dy / (size.height / 2),
            );
          });
        },
        onPanEnd: (_) => _runAnimation(),
        child: Align(
          alignment: _dragAlignment,
          child: Card(
            child: FlutterLogo(
              size: 128.0,
            ),
          ),
        ),
      ),
    );
  }
}
