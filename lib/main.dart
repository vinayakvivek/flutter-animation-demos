import 'dart:math';

import 'package:animation_test/helpers/custom_scaffold.dart';
import 'package:animation_test/widgets/animated_container_demo.dart';
import 'package:animation_test/widgets/custom_animation_demo.dart';
import 'package:animation_test/widgets/explicit_animation_builder_demo.dart';
import 'package:animation_test/widgets/gesture_controlled_demo.dart';
import 'package:animation_test/widgets/physics_based_demo.dart';
import 'package:animation_test/widgets/tween_demo.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget _button(String name, Widget target) {
    return MaterialButton(
      child: Text(name),
      color: Colors.deepPurple[100],
      onPressed: () => Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => target),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Animation Demos',
      body: Container(
        margin: const EdgeInsets.only(top: 50.0),
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
        child: ListView(
          children: [
            _button('AnimatedContainer', AnimatedContainerDemo()),
            _button('TweenAnimationBuilder', TweenDemo()),
            _button('ExplicitAnimationBuilder', ExplicitAnimationBuilderDemo()),
            _button('Custom', CustomAnimationDemo()),
            _button('PhysicsBased', PhysicsBasedAnimationDemo()),
            _button('GestureControlled', GestureControlledDemo()),
          ],
        ),
      ),
      requireBack: false,
    );
  }
}
