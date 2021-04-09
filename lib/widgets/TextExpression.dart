import 'package:flutter/material.dart';
import 'package:calculator/utils/expressions.dart';

class TextBuffer {
  String value;
  bool isExpression;

  TextBuffer(this.value, this.isExpression);
}

class TextExpression extends StatefulWidget {
  final String text;
  TextExpression({this.text}) : super(key: new Key(text));

  @override
  _TextExpressionState createState() => _TextExpressionState(text: text);
}

class _TextExpressionState extends State<TextExpression> {
  final TextStyle _secundaryTextStyle = TextStyle(
      fontWeight: FontWeight.w400, color: Colors.black, letterSpacing: 3);
  final TextStyle _operatorTextStyle = TextStyle(color: Colors.red);

  List<TextBuffer> textBuffer;

  _TextExpressionState({String text}) {
    textBuffer = text
        .split(' ')
        .map((l) => new TextBuffer(l + ' ', listExpressions.indexOf(l) > -1))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle _textStyle =
        Theme.of(context).textTheme.headline5.merge(_secundaryTextStyle);

    return RichText(
      text: TextSpan(
        text: '',
        style: _textStyle,
        children: textBuffer
            .map(
              (t) => TextSpan(
                text: t.value,
                style: t.isExpression
                    ? _textStyle.merge(_operatorTextStyle)
                    : _textStyle,
              ),
            )
            .toList(),
      ),
    );
  }
}
