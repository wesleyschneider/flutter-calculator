import 'package:calculator/utils/expressions.dart';

class Operation {
  String key;
  RegExp regexp;
  Function(double prev, double next) callback;

  Operation({this.key, this.regexp, this.callback});
}

final List<Operation> listOperations = [
  Operation(
      key: 'x', regexp: multiRegExp, callback: (prev, next) => prev * next),
  Operation(key: '/', regexp: divRegExp, callback: (prev, next) => prev / next),
  Operation(key: '+', regexp: sumRegExp, callback: (prev, next) => prev + next),
  Operation(key: '-', regexp: subRegExp, callback: (prev, next) => prev - next),
];

String calculeOperation(String accumulator, Operation operation) {
  String response = accumulator;
  while (operation.regexp.stringMatch(response) != null) {
    String exp = operation.regexp.stringMatch(response);

    double prev = double.parse(exp.substring(0, exp.indexOf(operation.key)));
    double next =
        double.parse(exp.substring(exp.indexOf(operation.key) + 1, exp.length));

    response = response.replaceFirst(
        operation.regexp, operation.callback(prev, next).toString());
  }

  return response;
}

double calculeExpression(String expression) {
  String response = expression;

  listOperations.forEach((operation) {
    response = calculeOperation(response, operation);
  });

  return double.parse(response);
}
