import 'package:flutter/material.dart';
import 'package:quiz_app/Constants/constants.dart';

class ResultBox extends StatelessWidget {
  const ResultBox({Key? key, required this.mark, required this.total_question, required this.onPressed})
      : super(key: key);
  final int mark;
  final int total_question;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      content: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(height: 25),
            Text(
              'Congrats!',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
            ),
            SizedBox(height: 15),
            Text(
              '${(mark / total_question * 100).toStringAsFixed(1)}% Score',
              style: TextStyle(fontSize: 30, color: mark < total_question / 2 ? incorrect : correct, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Text(
              'Quiz completed successfully',
              style: TextStyle(color: Colors.black, fontSize: 14,fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 15),
            Text(
              "You attempt $total_question questions,and from that $mark answer is correct.",
              style: TextStyle(color: background, fontSize: 17),
            ),
            SizedBox(height: 25),
            GestureDetector(
              onTap: onPressed,
              child: Text(
                mark < total_question / 2 ? 'Try Again' : 'Start Over',
                style: TextStyle(
                  color: mark < total_question / 2 ? Colors.red : Colors.green,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
