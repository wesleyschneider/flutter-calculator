import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calculator/provider/CalculatorModel.dart';
import 'package:calculator/utils/expressions.dart';

class TextBuffer {
  String value;
  bool isExpression;

  TextBuffer(this.value, this.isExpression);
}

class TextExpression extends StatelessWidget {
  final TextStyle _secundaryTextStyle = TextStyle(
      fontWeight: FontWeight.w400,
      color: Colors.black,
      letterSpacing: 3,
      fontSize: 22);

  @override
  Widget build(BuildContext context) {
    final TextStyle _textStyle =
        Theme.of(context).textTheme.headline5.merge(_secundaryTextStyle);
    final TextStyle _operatorTextStyle = TextStyle(color: Colors.red);

    return Consumer<CalculatorModel>(
      builder: (context, calculator, child) {
        List<TextBuffer> textBuffer = calculator.listValues
            .map(
              (l) => new TextBuffer(l + ' ', listExpressions.indexOf(l) > -1),
            )
            .toList();

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
      },
    );
  }
}
