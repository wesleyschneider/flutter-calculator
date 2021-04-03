import 'package:calculator/widgets/TextExpression.dart';
import 'package:flutter/material.dart';

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
            Text(
              '12.936',
              style: Theme.of(context)
                  .textTheme
                  .headline3
                  .merge(_principalTextStyle),
            )
          ],
        ),
      ),
    );
  }
}
