import 'dart:collection';
import 'package:flutter/foundation.dart';
import 'package:calculator/utils/expressions.dart';
import 'package:calculator/utils/operations.dart';

class CalculatorModel extends ChangeNotifier {
  final List<String> _listValues = [];
  String _bufferResult = '';

  UnmodifiableListView<String> get listValues =>
      UnmodifiableListView(_listValues);
  String get bufferResult => _bufferResult;

  void handleBufferExpressions(String value) {
    if (value == '=') {
      handleBufferResult();
      return;
    }

    try {
      if (value == ',') {
        if (_listValues.length == 0) {
          _listValues.add('0' + value);
          return;
        }

        if (_listValues.last.indexOf(',') > -1) {
          return;
        }

        if (listExpressions.indexOf(_listValues.last) != -1) {
          _listValues.add('0' + value);
          return;
        }
      }

      if (listExpressions.indexOf(value) == -1) {
        if (_listValues.length == 0) {
          _listValues.add(value);
          return;
        }

        if (listExpressions.indexOf(_listValues.last) > -1) {
          _listValues.add(value);
          return;
        }

        if (_listValues.last.replaceAll(RegExp('/(\.|\,)/g'), '').length > 8) {
          return;
        }

        _listValues[_listValues.length - 1] = _listValues.last + value;
      } else {
        if (listExpressions.indexOf(_listValues.last) == -1) {
          if (_listValues.last.endsWith(',')) {
            _listValues[_listValues.length - 1] = _listValues.last + '0';
          }

          _listValues.add(value);
          return;
        }
      }
    } finally {
      notifyListeners();
    }
  }

  void clearAll() {
    _listValues.clear();
    _bufferResult = '';

    notifyListeners();
  }

  void backspace() {
    if (_listValues.last.length > 1) {
      _listValues[_listValues.length - 1] = _listValues.last.replaceRange(
          _listValues.last.length - 1, _listValues.last.length, '');

      handleBufferResult();
      return;
    } else {
      _listValues.removeLast();
    }

    _bufferResult = '';

    notifyListeners();
  }

  void changePositiveNegative() {
    if (_listValues.length == 0) {
      return;
    }

    if (listExpressions.indexOf(_listValues.last) > -1) {
      return;
    }

    var newValue = _listValues.last.indexOf('-') > -1
        ? _listValues.last.replaceAll('-', '')
        : "-${_listValues.last}";

    _listValues.last = newValue;
    _bufferResult = '';

    notifyListeners();
  }

  void handleBufferResult() {
    if (_listValues.length == 0) {
      return;
    }

    final String mathExpression = _listValues.join('').replaceAll(',', '.');

    double total = calculeExpression(mathExpression);

    _bufferResult = total % 1 == 0
        ? total.toInt().toString()
        : total.toString().replaceAll('.', ',');

    notifyListeners();
  }
}
