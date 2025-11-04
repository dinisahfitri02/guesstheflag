import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  final String text;
  final bool answered;
  final bool isCorrect;
  final bool isSelected;
  final Function()? onTap;
  final double buttonHeight;
  final double screenWidth;

  const AnswerButton({
    super.key,
    required this.text,
    required this.answered,
    required this.isCorrect,
    required this.isSelected,
    required this.onTap,
    required this.buttonHeight,
    required this.screenWidth,
  });

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    BorderSide borderStyle = BorderSide.none;

    if (!answered) {
      backgroundColor = const Color(0xFFA10D99);
    } else if (isCorrect) {
      backgroundColor = Colors.green;
    } else if (isSelected && !isCorrect) {
      backgroundColor = Colors.red;
    } else {
      backgroundColor = Colors.white;
      borderStyle = const BorderSide(color: Colors.black, width: 1);
    }

    // sebelum dijawab
    if (!answered) {
      return Padding(
        padding: EdgeInsets.symmetric(vertical: buttonHeight * 0.15),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: backgroundColor,
            foregroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(screenWidth * 0.05),
              side: borderStyle,
            ),
            minimumSize: Size(double.infinity, buttonHeight),
          ),
          onPressed: onTap,
          child: Text(
            text,
            style: TextStyle(
              fontSize: screenWidth * 0.045,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(vertical: buttonHeight * 0.15),
      child: Container(
        width: double.infinity,
        height: buttonHeight,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(screenWidth * 0.05),
          border: Border.fromBorderSide(borderStyle),
        ),
        child: Text(
          text,
          style: TextStyle(
            fontSize: screenWidth * 0.045,
            fontWeight: FontWeight.w500,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}
