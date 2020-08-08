import 'dart:math';

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

class DemoAnimatedContainer extends StatefulWidget {
  @override
  _DemoAnimatedContainerState createState() => _DemoAnimatedContainerState();
}

class _DemoAnimatedContainerState extends State<DemoAnimatedContainer> {

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
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedContainer'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          width: _size,
          height: _size,
          decoration: BoxDecoration(
            color: _color,
            borderRadius: BorderRadius.circular(_radius)
          ),
        ),
      ),
      floatingActionButton: MaterialButton(
        color: Colors.blueGrey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18.0),
        ),
        child: Text(
          'Animate',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        onPressed: () => setState(setRandomState),
      ),
    );
  }
}
