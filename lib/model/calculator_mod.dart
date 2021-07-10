import 'package:flutter/material.dart';

class CalculatorModel with ChangeNotifier {
  String _resultString = "0";
  String get resultString => _resultString;
  set resultString(String resultString) {
    _resultString = resultString;
    notifyListeners();
  }

  String _leftString = "0";
  String get leftString => _leftString;
  set leftString(leftString) {
    _leftString = leftString;
    notifyListeners();
  }

  String _rightString = "0";
  String get rightString => _rightString;
  set rightString(rightString) {
    _rightString = rightString;
    notifyListeners();
  }

  double _result = 0.0;
  double get result => _result;
  set result(result) {
    _result = result;
    notifyListeners();
  }

  List<String> _operators = ['+', '-', '*', '/'];
  String _selectedOperation = '+';
  List<String> get operators => _operators;
  String get selected => _selectedOperation;
  void setOperation(String o) {
    _selectedOperation = o;
    notifyListeners();
  }

  double tempLeft = 0.0;

  void calculateResult() {
    tempLeft = double.parse(_leftString);
    switch (_selectedOperation) {
      case '+':
        tempLeft += double.parse(_rightString);
        _result = tempLeft;
        break;
      case '-':
        tempLeft -= double.parse(_rightString);
        _result = tempLeft;
        break;
      case '*':
        tempLeft *= double.parse(_rightString);
        _result = tempLeft;
        break;
      case '/':
        tempLeft /= double.parse(_rightString);
        _result = tempLeft;
        break;
      default:
        break;
    }
    _resultString = _result.toString();
    notifyListeners();
  }
}
