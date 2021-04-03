import 'package:flutter/material.dart';
import 'package:calculator/widgets/ButtonKeyboard.dart';

class Keyboard extends StatelessWidget {
  final BoxDecoration _decoration = BoxDecoration(
    color: Colors.grey[100],
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(30),
      topRight: Radius.circular(30),
    ),
  );
  final EdgeInsets _padding = EdgeInsets.all(30);
  final MainAxisAlignment _mainAxisAlignment = MainAxisAlignment.spaceBetween;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Container(
        decoration: _decoration,
        padding: _padding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              mainAxisAlignment: _mainAxisAlignment,
              children: <Widget>[
                ButtonKeyboard(
                  text: 'AC',
                  color: Colors.green,
                ),
                ButtonKeyboard(
                  text: 'C',
                  color: Colors.green,
                ),
                ButtonKeyboard(
                  text: '%',
                  color: Colors.green,
                ),
                ButtonKeyboard(
                  text: '/',
                  color: Colors.red,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: _mainAxisAlignment,
              children: <Widget>[
                ButtonKeyboard(
                  text: '7',
                ),
                ButtonKeyboard(
                  text: '8',
                ),
                ButtonKeyboard(
                  text: '9',
                ),
                ButtonKeyboard(
                  iconName: Icons.close,
                  color: Colors.red,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: _mainAxisAlignment,
              children: <Widget>[
                ButtonKeyboard(
                  text: '4',
                ),
                ButtonKeyboard(
                  text: '5',
                ),
                ButtonKeyboard(
                  text: '6',
                ),
                ButtonKeyboard(
                  iconName: Icons.remove,
                  color: Colors.red,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: _mainAxisAlignment,
              children: <Widget>[
                ButtonKeyboard(
                  text: '1',
                ),
                ButtonKeyboard(
                  text: '2',
                ),
                ButtonKeyboard(
                  text: '3',
                ),
                ButtonKeyboard(
                  iconName: Icons.add,
                  color: Colors.red,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: _mainAxisAlignment,
              children: <Widget>[
                ButtonKeyboard(
                  text: ',',
                ),
                ButtonKeyboard(
                  text: '0',
                ),
                ButtonKeyboard(
                  iconName: Icons.backspace_outlined,
                ),
                ButtonKeyboard(
                  text: '-',
                  color: Colors.red,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
