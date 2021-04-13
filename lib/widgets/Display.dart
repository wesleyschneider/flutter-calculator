import 'package:calculator/widgets/TextExpression.dart';
import 'package:flutter/material.dart';

class Display extends StatelessWidget {
  final EdgeInsets _padding = EdgeInsets.all(30);
  final TextStyle _principalTextStyle = TextStyle(
      fontWeight: FontWeight.bold, color: Colors.black, letterSpacing: 3);

  Display({this.bufferExpressions, this.bufferResult})
      : super(key: new Key(bufferExpressions + bufferResult));

  final String bufferExpressions;
  final String bufferResult;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: _padding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: <Widget>[
            TextExpression(text: bufferExpressions),
            Text(
              bufferResult,
              style: Theme.of(context)
                  .textTheme
                  .headline4
                  .merge(_principalTextStyle),
            )
          ],
        ),
      ),
    );
  }
}
