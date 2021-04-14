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

  final Function(String value) handleBufferExpressions;
  final VoidCallback clearAll;
  final VoidCallback backspace;
  final VoidCallback changePositiveNegative;

  Keyboard(
      {this.handleBufferExpressions,
      this.clearAll,
      this.backspace,
      this.changePositiveNegative});

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
                  onPressed: () => clearAll(),
                ),
                ButtonKeyboard(
                  iconName: Icons.backspace_outlined,
                  color: Colors.green,
                  onPressed: () => backspace(),
                ),
                ButtonKeyboard(
                  text: '+/-',
                  color: Colors.green,
                  onPressed: () => changePositiveNegative(),
                ),
                ButtonKeyboard(
                  text: '/',
                  color: Colors.red,
                  onPressed: () => handleBufferExpressions('/'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: _mainAxisAlignment,
              children: <Widget>[
                ButtonKeyboard(
                  text: '7',
                  onPressed: () => handleBufferExpressions('7'),
                ),
                ButtonKeyboard(
                  text: '8',
                  onPressed: () => handleBufferExpressions('8'),
                ),
                ButtonKeyboard(
                  text: '9',
                  onPressed: () => handleBufferExpressions('9'),
                ),
                ButtonKeyboard(
                  iconName: Icons.close,
                  color: Colors.red,
                  onPressed: () => handleBufferExpressions('x'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: _mainAxisAlignment,
              children: <Widget>[
                ButtonKeyboard(
                  text: '4',
                  onPressed: () => handleBufferExpressions('4'),
                ),
                ButtonKeyboard(
                  text: '5',
                  onPressed: () => handleBufferExpressions('5'),
                ),
                ButtonKeyboard(
                  text: '6',
                  onPressed: () => handleBufferExpressions('6'),
                ),
                ButtonKeyboard(
                  iconName: Icons.remove,
                  color: Colors.red,
                  onPressed: () => handleBufferExpressions('-'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: _mainAxisAlignment,
              children: <Widget>[
                ButtonKeyboard(
                  text: '1',
                  onPressed: () => handleBufferExpressions('1'),
                ),
                ButtonKeyboard(
                  text: '2',
                  onPressed: () => handleBufferExpressions('2'),
                ),
                ButtonKeyboard(
                  text: '3',
                  onPressed: () => handleBufferExpressions('3'),
                ),
                ButtonKeyboard(
                  iconName: Icons.add,
                  color: Colors.red,
                  onPressed: () => handleBufferExpressions('+'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: _mainAxisAlignment,
              children: <Widget>[
                ButtonKeyboard(
                  text: '0',
                  onPressed: () => handleBufferExpressions('0'),
                  bigButton: true,
                ),
                ButtonKeyboard(
                  text: ',',
                  onPressed: () => handleBufferExpressions(','),
                ),
                ButtonKeyboard(
                  text: '=',
                  color: Colors.red,
                  onPressed: () => handleBufferExpressions('='),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
