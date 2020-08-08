import 'package:animation_test/helpers/animate_button.dart';
import 'package:animation_test/helpers/custom_scaffold.dart';
import 'package:animation_test/helpers/stars_background.dart';
import 'package:flutter/material.dart';

class TweenDemo extends StatefulWidget {
  @override
  _TweenDemoState createState() => _TweenDemoState();
}

class _TweenDemoState extends State<TweenDemo> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'TweenBuilder',
      body: Container(),
      floatingActionButton: AnimateButton(
        onPressed: () { print('Yo'); },
      ),
    );
  }
}
