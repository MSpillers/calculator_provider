import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calculator_provider/model/calculator_mod.dart';
import 'package:calculator_provider/widget/calculator_interface.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CalculatorModel>(
        create: (context) => CalculatorModel(),
        child: MaterialApp(
          title: 'Calculator',
          home: Calculator(),
        ));
  }
}

class Calculator extends StatefulWidget {
  Calculator({Key? key}) : super(key: key);
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator"),
      ),
      body: CalculatorInterface(),
    );
  }
}
