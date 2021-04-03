import 'package:calculator/widgets/Display.dart';
import 'package:calculator/widgets/Keyboard.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final Color backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: backgroundColor,
        child: Column(
          children: <Widget>[
            Display(),
            Keyboard(),
          ],
        ),
      ),
    );
  }
}
