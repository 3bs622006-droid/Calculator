import 'package:calaculator_app/Calculator/calculator_button.dart';
import 'package:calaculator_app/Calculator/calculator_colors.dart';
import 'package:flutter/material.dart';

class CalcScreen extends StatefulWidget {
  static const String routeName = 'Calculator';

  @override
  State<CalcScreen> createState() => _CalcScreenState();
}

class _CalcScreenState extends State<CalcScreen> {
  String resText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CalculatorColors.blackColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Container(
                alignment: Alignment.centerRight,
                child: Text(
                  resText,
                  style: TextStyle(
                    color: CalculatorColors.whiteColor,
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                spacing: 18,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(
                            spacing: 18,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              CalculatorButton(
                                text: 'Ac',
                                onButtonClick: onClearClick,
                                backgroundColor:
                                    CalculatorColors.lightGrayColor,
                                textColor: CalculatorColors.whiteColor,
                              ),
                              CalculatorButton(
                                text: '<',
                                onButtonClick: onBackSpaceClick,
                                isIcon: true,
                                backgroundColor:
                                    CalculatorColors.lightGrayColor,
                                textColor: CalculatorColors.whiteColor,
                                child: Icon(
                                  Icons.backspace_outlined,
                                  color: CalculatorColors.whiteColor,
                                ),
                              ),
                              CalculatorButton(
                                text: '/',
                                onButtonClick: onOperatorClick,
                                backgroundColor: CalculatorColors.darkBlueColor,
                                textColor: CalculatorColors.whiteColor,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            spacing: 18,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              CalculatorButton(
                                text: '7',
                                onButtonClick: onDigitClick,
                              ),
                              CalculatorButton(
                                text: '8',
                                onButtonClick: onDigitClick,
                              ),
                              CalculatorButton(
                                text: '9',
                                onButtonClick: onDigitClick,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            spacing: 18,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              CalculatorButton(
                                text: '4',
                                onButtonClick: onDigitClick,
                              ),
                              CalculatorButton(
                                text: '5',
                                onButtonClick: onDigitClick,
                              ),
                              CalculatorButton(
                                text: '6',
                                onButtonClick: onDigitClick,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            spacing: 18,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              CalculatorButton(
                                text: '1',
                                onButtonClick: onDigitClick,
                              ),
                              CalculatorButton(
                                text: '2',
                                onButtonClick: onDigitClick,
                              ),
                              CalculatorButton(
                                text: '3',
                                onButtonClick: onDigitClick,
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Row(
                            spacing: 18,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Expanded(
                                child: CalculatorButton(
                                  text: '0',
                                  flex: 2,
                                  onButtonClick: onDigitClick,
                                ),
                              ),
                              Expanded(
                                child: CalculatorButton(
                                  text: '.',
                                  flex: 1,
                                  onButtonClick: onDigitClick,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CalculatorButton(
                          text: '*',
                          onButtonClick: onOperatorClick,
                          flex: 2,
                          backgroundColor: CalculatorColors.darkBlueColor,
                          textColor: CalculatorColors.whiteColor,
                        ),
                        CalculatorButton(
                          text: '-',
                          onButtonClick: onOperatorClick,
                          flex: 2,
                          backgroundColor: CalculatorColors.darkBlueColor,
                          textColor: CalculatorColors.whiteColor,
                        ),
                        CalculatorButton(
                          text: '+',
                          onButtonClick: onOperatorClick,
                          flex: 3,
                          backgroundColor: CalculatorColors.darkBlueColor,
                          textColor: CalculatorColors.whiteColor,
                        ),
                        CalculatorButton(
                          text: '=',
                          onButtonClick: onEqualClick,
                          flex: 3,
                          backgroundColor: CalculatorColors.lightBlueColor,
                          textColor: CalculatorColors.whiteColor,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void onDigitClick(String text) {
    if (text == '.' && resText.contains('.')) {
      return;
    }
    resText += text;
    setState(() {});
  }

  String lhs = '';
  String operator = '';

  void onOperatorClick(String clickedOperator) {
    if (operator.isEmpty) {
      lhs = resText;
    } else {
      String rhs = resText;
      lhs = calculate(lhs, operator, rhs);
    }

    operator = clickedOperator;
    resText = '';
    setState(() {});
  }

  String calculate(String lhs, String operator, String rhs) {
    double num1 = double.parse(lhs);
    double num2 = double.parse(rhs);
    double res = 0.0;

    if (operator == '+') {
      res = num1 + num2;
    } else if (operator == '-') {
      res = num1 - num2;
    } else if (operator == '*') {
      res = num1 * num2;
    } else if (operator == '/') {
      res = num1 / num2;
    }
    return res.toString();
  }

  void onEqualClick(String text) {
    String rhs = resText;
    resText = calculate(lhs, operator, rhs);
    lhs = '';
    operator = '';
    setState(() {});
  }

  void onClearClick(String text) {
    lhs = '';
    resText = '';
    operator = '';

    setState(() {});
  }

  void onBackSpaceClick(String text) {
    if (resText.isEmpty) {
      return;
    }
    resText = resText.substring(0, resText.length - 1);

    setState(() {});
  }
}
