import 'package:flutter/material.dart';

class AnimateButton extends StatelessWidget {

  final Function onPressed;
  AnimateButton({ @required this.onPressed });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
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
      onPressed: onPressed,
    );
  }
}
