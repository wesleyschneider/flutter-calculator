import 'package:flutter/material.dart';

class ButtonKeyboard extends StatelessWidget {
  final BorderRadius _borderRadius = BorderRadius.all(
    Radius.circular(15),
  );
  final TextStyle _textStyle = TextStyle(fontSize: 20);
  final String text;
  final IconData iconName;
  final Color color;
  final Function onPressed;
  final bool bigButton;

  ButtonKeyboard({
    this.text,
    this.iconName,
    this.color,
    this.onPressed,
    this.bigButton,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: _borderRadius,
      color: Colors.grey[300],
      child: InkWell(
        borderRadius: _borderRadius,
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.all(25),
          width: bigButton != null && bigButton ? 170 : 80,
          height: 80,
          child: Center(
            child: iconName != null
                ? Icon(
                    iconName,
                    size: 20,
                    color: color ?? Colors.black,
                  )
                : Text(
                    text,
                    style: TextStyle(color: color ?? Colors.black)
                        .merge(_textStyle),
                  ),
          ),
        ),
      ),
    );
  }
}
