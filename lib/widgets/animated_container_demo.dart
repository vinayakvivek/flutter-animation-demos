import 'dart:math';

import 'package:animation_test/helpers/animate_button.dart';
import 'package:animation_test/helpers/custom_scaffold.dart';
import 'package:flutter/material.dart';

class SineCurve extends Curve {
  final double count;
  SineCurve({this.count = 1});

  @override
  double transformInternal(double t) {
    return sin(count * 2 * pi * t) * 0.5 + 0.5;
  }
}

double randomSize() {
  return 10 + Random().nextDouble() * 100;
}

double randomBorderRadius() {
  return Random().nextDouble() * 50;
}

Color randomColor() {
  return Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
}

class AnimatedContainerDemo extends StatefulWidget {
  @override
  _AnimatedContainerDemoState createState() => _AnimatedContainerDemoState();
}

class _AnimatedContainerDemoState extends State<AnimatedContainerDemo> {
  double _size;
  Color _color;
  double _radius;

  @override
  void initState() {
    super.initState();
    setRandomState();
  }

  void setRandomState() {
    _size = randomSize();
    _color = randomColor();
    _radius = randomSize() / 2;
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'AnimatedContainer',
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          width: _size,
          height: _size,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: BorderRadius.circular(_radius),
            border: Border.all(color: Colors.white)
          ),
        ),
      ),
      floatingActionButton: AnimateButton(
        onPressed: () => setState(setRandomState),
      ),
    );
  }
}
