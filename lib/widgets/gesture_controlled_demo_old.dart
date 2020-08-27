import 'dart:math';

import 'package:animation_test/helpers/animate_button.dart';
import 'package:animation_test/helpers/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AnimationNotifier extends ChangeNotifier {
  final AnimationController _animationController;

  AnimationNotifier(this._animationController) {
    _animationController.addListener(_onAnimationControllerChanged);
  }

  void forward() => _animationController.forward();
  void reverse() => _animationController.reverse();

  void _onAnimationControllerChanged() {
    notifyListeners();
  }

  @override
  void dispose() {
    _animationController.removeListener(_onAnimationControllerChanged);
    super.dispose();
  }

  double get value => _animationController.value;
}

var animationProvider;

class GestureControlledAnimationDemo extends StatefulWidget {
  @override
  _GestureControlledAnimationDemoState createState() =>
      _GestureControlledAnimationDemoState();
}

class _GestureControlledAnimationDemoState
    extends State<GestureControlledAnimationDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  double get maxHeight => 420.0;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    );
    animationProvider = ChangeNotifierProvider((_) {
      return AnimationNotifier(_controller);
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'GestureControlled',
      body: GestureDetector(
        onVerticalDragUpdate: _handleDragUpdate,
        onVerticalDragEnd: _handleDragEnd,
        child: Container(
          color: Colors.red,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Yo',
                  style: TextStyle(color: Colors.white),
                ),
                NotifierTest(),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: AnimateButton(
        title: 'Test',
        onPressed: () {
          // _controller.repeat();
        },
      ),
    );
  }

  void _handleDragUpdate(DragUpdateDetails details) {
    _controller.value -= details.primaryDelta / maxHeight;
  }

  void _handleDragEnd(DragEndDetails details) {
    if (_controller.isAnimating ||
        _controller.status == AnimationStatus.completed) return;

    final double flingVelocity =
        details.velocity.pixelsPerSecond.dy / maxHeight;
    if (flingVelocity < 0.0) {
      _controller.fling(velocity: max(2.0, -flingVelocity));
    } else if (flingVelocity > 0.0) {
      _controller.fling(velocity: min(-2.0, -flingVelocity));
    } else {
      _controller.fling(velocity: _controller.value < 0.5 ? -2.0 : 2.0);
    }
  }
}

class NotifierTest extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final animationNotifier = useProvider(animationProvider);
    double count = animationNotifier.value * 1000.0;
    return Container(
      child: Text(
        '${count.floor()}',
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
