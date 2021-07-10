import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:calculator_provider/model/calculator_mod.dart';

class CalculatorInterface extends StatelessWidget {
  final _leftFeildController = TextEditingController();
  final _rightFieldContoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    {
      return Align(
        alignment: Alignment.bottomRight,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              child: Row(
                children: [
                  Expanded(
                      child: TextFormField(
                    controller: _leftFeildController,
                    keyboardType: TextInputType.number,
                    //decoration: InputDecoration(border: InputBorder.none),
                  )),
                  Expanded(
                      child: Consumer<CalculatorModel>(
                    builder: (context, calculatorModel, child) =>
                        DropdownButton<String>(
                      value: calculatorModel.selected,
                      onChanged: (String? newValue) {
                        //model.setOperation(newValue!);
                        Provider.of<CalculatorModel>(context, listen: false)
                            .setOperation(newValue!);
                      },
                      items:
                          Provider.of<CalculatorModel>(context, listen: false)
                              .operators
                              .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  )),
                  Expanded(
                      child: TextFormField(
                    controller: _rightFieldContoller,
                    keyboardType: TextInputType.number,
                  )),
                  Expanded(
                    child: ElevatedButton(
                      child: Text("="),
                      onPressed: () {
                        Provider.of<CalculatorModel>(context, listen: false)
                            .rightString = _rightFieldContoller.text;
                        Provider.of<CalculatorModel>(context, listen: false)
                            .leftString = _leftFeildController.text;
                        Provider.of<CalculatorModel>(context, listen: false)
                            .calculateResult();
                      },
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              child: Row(children: <Widget>[
                Expanded(
                  child: Center(
                      child: Text(
                          Provider.of<CalculatorModel>(context).resultString,
                          style: TextStyle(fontSize: 20.0))),
                ),
              ]),
            )
          ],
        ),
      );
    }
  }
}
