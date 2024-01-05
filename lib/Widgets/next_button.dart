import 'package:flutter/material.dart';
import 'package:quiz_app/Constants/constants.dart';
class NextButton extends StatelessWidget {
  final bool isLastQuestion;

  const NextButton({Key? key, required this.isLastQuestion}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: background,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        isLastQuestion ? 'Submit' : 'Next Question',
        style: const TextStyle(fontSize: 20, color: Colors.white),
        textAlign: TextAlign.center,
      ),
    );
  }
}

