import 'package:calculator/widgets/Display.dart';
import 'package:calculator/widgets/Keyboard.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Color _backgroundColor = Colors.white;

  String bufferExpressions = '304 x 4';
  String bufferResult = '1.216';

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        color: _backgroundColor,
        child: Column(
          children: <Widget>[
            Display(
              bufferExpressions: bufferExpressions,
              bufferResult: bufferResult,
            ),
            Keyboard(),
          ],
        ),
      ),
    );
  }
}
