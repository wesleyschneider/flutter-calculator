import 'package:flutter/material.dart';
import 'package:calculator/widgets/Display.dart';
import 'package:calculator/widgets/Keyboard.dart';
import 'package:calculator/utils/expressions.dart';
import 'package:calculator/utils/operations.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Color _backgroundColor = Colors.white;

  List<String> listValues = [];
  String bufferResult = '';

  void handleBufferExpressions(String value) {
    setState(() {
      if (value == '=') {
        handleBufferResult();
        return;
      }

      if (value == ',') {
        if (listValues.length == 0) {
          listValues.add('0' + value);
        }

        if (listValues.last.indexOf(',') > -1) {
          return;
        }

        if (listExpressions.indexOf(listValues.last) == -1) {
        } else {
          listValues.add('0' + value);
        }
      }

      if (listExpressions.indexOf(value) == -1) {
        if (listValues.length == 0) {
          listValues.add(value);
          return;
        }

        if (listExpressions.indexOf(listValues.last) > -1) {
          listValues.add(value);
          return;
        }

        if (listValues.last.replaceAll(RegExp('/(\.|\,)/g'), '').length > 8) {
          return;
        }

        listValues[listValues.length - 1] = listValues.last + value;
      } else {
        if (listExpressions.indexOf(listValues.last) == -1) {
          if (listValues.last.endsWith(',')) {
            listValues[listValues.length - 1] = listValues.last + '0';
          }

          listValues.add(value);
          return;
        }
      }
    });
  }

  void clearAll() {
    setState(() {
      listValues.clear();
      bufferResult = '';
    });
  }

  void backspace() {
    setState(() {
      if (listValues.last.length > 1) {
        listValues[listValues.length - 1] = listValues.last.replaceRange(
            listValues.last.length - 1, listValues.last.length, '');
      } else {
        listValues.removeLast();
      }

      handleBufferResult();
    });
  }

  void handleBufferResult() {
    setState(() {
      if (listValues.length == 0) {
        return;
      }

      String mathExpression = listValues.join('').replaceAll(',', '.');

      double total = calculeExpression(mathExpression);

      bufferResult = total % 1 == 0
          ? total.toInt().toString()
          : total.toString().replaceAll('.', ',');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: _backgroundColor,
      child: Column(
        children: <Widget>[
          Display(
            bufferExpressions: listValues.join(' '),
            bufferResult: bufferResult,
          ),
          Keyboard(
            handleBufferExpressions: handleBufferExpressions,
            clearAll: clearAll,
            backspace: backspace,
          ),
        ],
      ),
    );
  }
}
