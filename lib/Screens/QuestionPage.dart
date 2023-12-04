import 'package:flutter/material.dart';
import 'package:quiz_app/Database/database_connetion.dart';
import 'package:quiz_app/Widgets/option_card.dart';
import 'package:quiz_app/Widgets/question_widgets.dart';
import '../Model/model class.dart';
import '../Widgets/next_button.dart';
import '../Widgets/resultbox.dart';

class QuestionPage extends StatefulWidget {
  final String categoryName;

  const QuestionPage({Key? key, required this.categoryName}) : super(key: key);

  @override
  State<QuestionPage> createState() => _QuestionPageState();
}

class _QuestionPageState extends State<QuestionPage> {
  var db = Dbconnect();
  late Future _questions;

  Future<List<Question>> getData() async {
    return db.fetchQuestions(widget.categoryName);
  }

  @override
  void initState() {
    super.initState();
    _questions = getData();
  }

  int index = 0;
  int mark = 0;
  bool ispressed = false;
  bool isAlreadySelected = false;

  void checkAnswer(bool value){
    if(isAlreadySelected){
      return;
    }else{
      setState(() {
        ispressed=true;
        isAlreadySelected=true;
      });
      if(value==true){
        mark++;

      }
    }
  }

  void startOver() {
    setState(() {
      index = 0;
      mark = 0;
      ispressed = false;
      isAlreadySelected = false;
    });

    Navigator.pop(context);
  }

  void nextQuestion(int totalQuestion) {
    if (index == totalQuestion - 1) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (ctx) => ResultBox(
          mark: mark,
          total_question: totalQuestion,
          onPressed: startOver,
        ),
      );
    } else {
      if (ispressed) {
        setState(() {
          index++;
          ispressed = false;
          isAlreadySelected = false;
        });
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            behavior: SnackBarBehavior.floating,
            backgroundColor: Colors.red,
            content: Text('Select an option'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _questions as Future<List<Question>>,
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          } else if (snapshot.hasData) {
            var extractedData = snapshot.data as List<Question>;
            return Scaffold(
              backgroundColor: Colors.white,
              appBar: AppBar(
                backgroundColor: Colors.blue,
                shadowColor: Colors.transparent,
                title: const Text(
                  'Quiz App',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                actions: [
                  Padding(
                    padding: const EdgeInsets.only(right: 25, top: 15),
                    child: Text(
                      'Mark : $mark',
                      style: const TextStyle(fontSize: 18),
                    ),
                  )
                ],
              ),
              body: Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    const SizedBox(height: 20,),
                    QuestionWidget(Question: extractedData[index].title, index: index),
                    const SizedBox(height: 80,),
                    for (int i = 0; i < extractedData[index].options.length; i++)
                      GestureDetector(
                        onTap: () => checkAnswer(extractedData[index].options.values.toList()[i]),
                        child: OptionCard(
                          option: extractedData[index].options.keys.toList()[i],
                          color: ispressed
                              ? extractedData[index].options.values.toList()[i] == true
                              ? Colors.green
                              : Colors.red
                              : Colors.grey,
                        ),
                      ),
                  ],
                ),
              ),
              floatingActionButton: GestureDetector(
                onTap: () => nextQuestion(extractedData.length),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: NextButton(),
                ),
              ),
              floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
            );
          } else {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 30,),
                  Text('Loading..', style: TextStyle(fontSize: 18, color: Colors.green),),
                ],
              ),
            );
          }
        }
        return const Center(child: CircularProgressIndicator(),);
      },
    );
  }
}