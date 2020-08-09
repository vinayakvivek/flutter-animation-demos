import 'package:flutter/material.dart';

class AnimateButton extends StatelessWidget {

  final String title;
  final Function onPressed;
  AnimateButton({ this.title = 'Animate', @required this.onPressed });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.blueGrey,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(18.0),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      onPressed: onPressed,
    );
  }
}
