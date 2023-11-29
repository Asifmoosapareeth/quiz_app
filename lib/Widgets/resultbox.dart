import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/Constants/constants.dart';

class ResultBox extends StatelessWidget {
  const ResultBox({super.key, required this.mark, required this.total_question, required this.onPressed});
   final int mark;
   final int total_question;
   final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.blueAccent,
      content: Padding(padding: EdgeInsets.all(70),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Result',style: TextStyle(fontSize: 25,color: nuetral),),
            SizedBox(height: 25,),
            CircleAvatar(
              radius: 60,
                child: Text('${mark}/${total_question}',
                  style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
            backgroundColor: mark==total_question/2?Colors.yellow
              :mark<total_question/2
              ? incorrect : correct,
            ),
            SizedBox(height: 15,),
            Text(mark==total_question/2? 'Almost There'
                :mark<total_question/2
                ? 'Try Again' : 'Well done',style: TextStyle(color: nuetral),),
            SizedBox(height: 25,),
            GestureDetector(
             onTap:onPressed ,
                child: Text('Start Over',style: TextStyle(
                    color: violett,fontSize: 20,fontWeight: FontWeight.bold
                ),))
          ],
      ),),
    );
  }
}
