import 'package:animation_test/helpers/animate_button.dart';
import 'package:animation_test/helpers/custom_scaffold.dart';
import 'package:flutter/material.dart';

class ExplicitAnimationBuilderDemo extends StatefulWidget {
  @override
  _ExplicitAnimationBuilderDemoState createState() =>
      _ExplicitAnimationBuilderDemoState();
}

class _ExplicitAnimationBuilderDemoState
    extends State<ExplicitAnimationBuilderDemo>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  String _buttonTitle;

  final Tween<double> turnsTween = Tween<double>(
    begin: 1,
    end: 3,
  );

  setButtonTitle() {
    _buttonTitle =
        _animationController.isAnimating ? 'Stop spinning' : 'Start spinning';
  }

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 15),
    );
    setButtonTitle();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'ExplicitAnimationBuilder',
      body: Center(
        child: Container(
          child: RotationTransition(
            alignment: Alignment.center,
            child: GalaxyImage(),
            turns: _animationController,
          ),
        ),
      ),
      floatingActionButton: AnimateButton(
        title: _buttonTitle,
        onPressed: () {
          if (_animationController.isAnimating) {
            _animationController.stop();
          } else {
            _animationController.repeat();
          }
          setState(() {
            setButtonTitle();
          });
        },
      ),
    );
  }
}

class GalaxyImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.asset('assets/galaxy_transparent.png');
  }
}
