import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calculator/provider/CalculatorModel.dart';
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
    var calculator = context.watch<CalculatorModel>();

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
                  onPressed: () => calculator.clearAll(),
                ),
                ButtonKeyboard(
                  iconName: Icons.backspace_outlined,
                  color: Colors.green,
                  onPressed: () => calculator.backspace(),
                ),
                ButtonKeyboard(
                  text: '+/-',
                  color: Colors.green,
                  onPressed: () => calculator.changePositiveNegative(),
                ),
                ButtonKeyboard(
                  text: '/',
                  color: Colors.red,
                  onPressed: () => calculator.handleBufferExpressions('/'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: _mainAxisAlignment,
              children: <Widget>[
                ButtonKeyboard(
                  text: '7',
                  onPressed: () => calculator.handleBufferExpressions('7'),
                ),
                ButtonKeyboard(
                  text: '8',
                  onPressed: () => calculator.handleBufferExpressions('8'),
                ),
                ButtonKeyboard(
                  text: '9',
                  onPressed: () => calculator.handleBufferExpressions('9'),
                ),
                ButtonKeyboard(
                  iconName: Icons.close,
                  color: Colors.red,
                  onPressed: () => calculator.handleBufferExpressions('x'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: _mainAxisAlignment,
              children: <Widget>[
                ButtonKeyboard(
                  text: '4',
                  onPressed: () => calculator.handleBufferExpressions('4'),
                ),
                ButtonKeyboard(
                  text: '5',
                  onPressed: () => calculator.handleBufferExpressions('5'),
                ),
                ButtonKeyboard(
                  text: '6',
                  onPressed: () => calculator.handleBufferExpressions('6'),
                ),
                ButtonKeyboard(
                  iconName: Icons.remove,
                  color: Colors.red,
                  onPressed: () => calculator.handleBufferExpressions('-'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: _mainAxisAlignment,
              children: <Widget>[
                ButtonKeyboard(
                  text: '1',
                  onPressed: () => calculator.handleBufferExpressions('1'),
                ),
                ButtonKeyboard(
                  text: '2',
                  onPressed: () => calculator.handleBufferExpressions('2'),
                ),
                ButtonKeyboard(
                  text: '3',
                  onPressed: () => calculator.handleBufferExpressions('3'),
                ),
                ButtonKeyboard(
                  iconName: Icons.add,
                  color: Colors.red,
                  onPressed: () => calculator.handleBufferExpressions('+'),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: _mainAxisAlignment,
              children: <Widget>[
                ButtonKeyboard(
                  text: '0',
                  onPressed: () => calculator.handleBufferExpressions('0'),
                  bigButton: true,
                ),
                ButtonKeyboard(
                  text: ',',
                  onPressed: () => calculator.handleBufferExpressions(','),
                ),
                ButtonKeyboard(
                  text: '=',
                  color: Colors.red,
                  onPressed: () => calculator.handleBufferExpressions('='),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
