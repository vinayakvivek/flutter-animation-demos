import 'dart:math';

import 'package:animation_test/helpers/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:flutter_hooks/flutter_hooks.dart';


final controllerProvider = StateProvider<AnimationController>((_) => null);

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

  static final provider = ChangeNotifierProvider.autoDispose<AnimationNotifier>((ref) {
    final controller = ref.read(controllerProvider)?.state;
    return AnimationNotifier(controller);
  });
}


class GestureControlledDemo extends HookWidget {
  double get maxHeight => 420.0;
  AnimationController _controller;

  @override
  Widget build(BuildContext context) {

    _controller = useAnimationController(duration: Duration(seconds: 1));
    useProvider(controllerProvider).state = _controller;

    return CustomScaffold(
      title: 'GestureControlled',
      body: GestureDetector(
        onVerticalDragUpdate: _handleDragUpdate,
        onVerticalDragEnd: _handleDragEnd,
        behavior: HitTestBehavior.opaque,
        child: Container(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Drag vertically on the screen',
                  style: TextStyle(color: Colors.white),
                ),
                SizedBox(height: 20.0,),
                NotifierTest(),
              ],
            ),
          ),
        ),
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
    final notifier = useProvider(AnimationNotifier.provider);
    double count = notifier.value * 1000.0;
    return Container(
      child: Text(
        '${count.floor()}',
        style: TextStyle(
          color: Colors.white,
          fontSize: 28.0
        ),
      ),
    );
  }
}
