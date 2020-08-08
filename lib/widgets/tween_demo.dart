import 'dart:math';

import 'package:animation_test/helpers/animate_button.dart';
import 'package:animation_test/helpers/custom_scaffold.dart';
import 'package:animation_test/helpers/stars_background.dart';
import 'package:flutter/material.dart';

class TweenDemo extends StatefulWidget {
  @override
  _TweenDemoState createState() => _TweenDemoState();
}

class _TweenDemoState extends State<TweenDemo> {

  double _size = 50.0;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'TweenAnimationBuilder',
      body: Container(
        child: Center(
          child: TweenAnimationBuilder(
            duration: Duration(seconds: 2),
            tween: Tween<double>(begin: 0, end: 2 * pi),
            builder: (_, angle, child) {
              return Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()..rotateY(angle),
                child: child,
              );
            },
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              child: Image.asset('assets/earth.png'),
            ),
          ),
        ),
      ),
      floatingActionButton: Container(),
    );
  }
}
