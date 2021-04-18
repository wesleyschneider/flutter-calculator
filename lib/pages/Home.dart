import 'package:flutter/material.dart';
import 'package:calculator/widgets/Display.dart';
import 'package:calculator/widgets/Keyboard.dart';

class Home extends StatelessWidget {
  final Color _backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _backgroundColor,
      child: Column(
        children: <Widget>[
          Display(),
          Keyboard(),
        ],
      ),
    );
  }
}
