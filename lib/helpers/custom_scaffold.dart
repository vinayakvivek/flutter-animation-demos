import 'package:animation_test/helpers/animate_button.dart';
import 'package:animation_test/helpers/stars_background.dart';
import 'package:flutter/material.dart';

class CustomScaffold extends StatelessWidget {
  final String title;
  final Widget body;
  final Widget floatingActionButton;
  final bool requireBack;

  const CustomScaffold({
    Key key,
    this.title,
    this.body,
    this.floatingActionButton,
    this.requireBack = true
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          // StarsBackground(),
          Container(
            margin: const EdgeInsets.fromLTRB(20.0, 50.0, 20.0, 0.0),
            height: 50,
            child: Row(
              children: [
                requireBack ? IconButton(
                  icon: Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () => Navigator.pop(context),
                ) : SizedBox.shrink(),
                SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.2,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
          body
        ],
      ),
      floatingActionButton: requireBack ? floatingActionButton : Container(),
    );
  }
}
