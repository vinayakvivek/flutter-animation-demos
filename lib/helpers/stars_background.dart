import 'package:flutter/material.dart';

class StarsBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      child: Image.asset(
        'assets/stars_bg.jpg',
        fit: BoxFit.cover,
      ),
    );
  }
}
