import 'package:flutter/cupertino.dart';
import 'package:quiz_app/Constants/constants.dart';

class NextButton extends StatelessWidget {
  const NextButton({super.key,});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      decoration: BoxDecoration(
        color: nuetral,
        borderRadius: BorderRadius.circular(10),),
      padding: EdgeInsets.symmetric(vertical: 10),
      child: const Text('Next Question',
        style: TextStyle(
            fontSize: 20),
        textAlign: TextAlign.center,),

    );
  }
}
