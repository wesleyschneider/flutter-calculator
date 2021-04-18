import 'package:calculator/provider/CalculatorModel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './pages/Home.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CalculatorModel(),
      child: MaterialApp(
        title: 'Calculator',
        home: Home(),
      ),
    );
  }
}
