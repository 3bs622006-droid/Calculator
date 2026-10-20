import 'package:calaculator_app/Calculator/calculator_colors.dart';
import 'package:flutter/material.dart';

typedef OnButtonClick = void Function(String);

class CalculatorButton extends StatelessWidget {
  String text;

  Color? backgroundColor;

  Color? textColor;

  int? flex;

  Widget? child;

  bool isIcon;

  OnButtonClick onButtonClick;

  CalculatorButton({
    required this.text,
    required this.onButtonClick,
    this.backgroundColor,
    this.textColor,
    this.flex,
    this.child,
    this.isIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex ?? 1,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),

        child: FloatingActionButton(
          onPressed: () {
            onButtonClick(text);
          },
          backgroundColor: backgroundColor ?? CalculatorColors.darkGrayColor,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusGeometry.circular(16),
          ),

          child: isIcon
              ? child
              : Text(
                  text,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: textColor ?? CalculatorColors.lightBlueColor,
                  ),
                ),
        ),
      ),
    );
  }
}
