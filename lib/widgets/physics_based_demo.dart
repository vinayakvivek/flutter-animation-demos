import 'package:animation_test/helpers/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

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

  void _runAnimation(Offset pixelsPerSecond, Size size) {
    _animation = _controller.drive(
      AlignmentTween(
        begin: _dragAlignment,
        end: Alignment.center,
      ),
    );

    // Calculate the velocity relative to the unit interval, [0,1],
    // used by the animation controller.
    final unitsPerSecondX = pixelsPerSecond.dx / size.width;
    final unitsPerSecondY = pixelsPerSecond.dy / size.height;
    final unitsPerSecond = Offset(unitsPerSecondX, unitsPerSecondY);
    final unitVelocity = unitsPerSecond.distance;

    const spring = SpringDescription(
      mass: 30,
      stiffness: 1,
      damping: 1,
    );

    final simulation = SpringSimulation(spring, 0, 1, -unitVelocity);
    _controller.animateWith(simulation);
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
        onPanEnd: (details) => _runAnimation(details.velocity.pixelsPerSecond, size),
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
