import 'package:flutter/material.dart';

class TextExpression extends StatelessWidget {
  final TextStyle _secundaryTextStyle = TextStyle(
      fontWeight: FontWeight.w400, color: Colors.black, letterSpacing: 3);
  final TextStyle _operatorTextStyle = TextStyle(color: Colors.red);
  final String text;

  TextExpression({this.text});

  @override
  Widget build(BuildContext context) {
    final TextStyle _textStyle =
        Theme.of(context).textTheme.headline5.merge(_secundaryTextStyle);

    return RichText(
      text: TextSpan(
        text: '',
        style: _textStyle,
        children: <TextSpan>[
          TextSpan(text: '308 '),
          TextSpan(
            text: 'x',
            style: _textStyle.merge(_operatorTextStyle),
          ),
          TextSpan(text: ' 42'),
        ],
      ),
    );
  }
}
