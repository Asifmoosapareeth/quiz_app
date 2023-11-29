import 'package:flutter/cupertino.dart';
import 'package:quiz_app/Constants/constants.dart';

class QuestionWidget extends StatelessWidget {
  const QuestionWidget({super.key, required this.Question, required this.index});

  final String Question;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      child:Text('${index+1}.  $Question',
        style: const TextStyle(
            fontSize: 20,
        color: nuetral
        ) , ) ,
    );
  }
}
