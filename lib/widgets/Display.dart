import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calculator/provider/CalculatorModel.dart';
import 'package:calculator/widgets/TextExpression.dart';

class Display extends StatelessWidget {
  final EdgeInsets _padding = EdgeInsets.all(30);
  final TextStyle _principalTextStyle = TextStyle(
      fontWeight: FontWeight.bold, color: Colors.black, letterSpacing: 3);

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
            TextExpression(),
            Consumer<CalculatorModel>(
              builder: (context, calculator, child) {
                return Text(
                  calculator.bufferResult,
                  style: Theme.of(context)
                      .textTheme
                      .headline4
                      .merge(_principalTextStyle),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
