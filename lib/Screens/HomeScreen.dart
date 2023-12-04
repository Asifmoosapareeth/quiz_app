import 'package:flutter/material.dart';
import 'package:quiz_app/Constants/constants.dart';
import '../Widgets/category_card.dart';
import 'QuestionPage.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> categories = ['General Programming','Flutter', 'Html', 'Css', 'Python','trial'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: const Text('Quiz App'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(30),
          ),
        ),
        toolbarHeight: 100,
        backgroundColor: appbaar,
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(height: 25,),
          ...categories
              .map(
                (category) => CategoryCard(
              category: category,
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => QuestionPage(categoryName: category),
                  ),
                );
              },
            ),
          )
              .toList(),
        ]
      ),
    );
  }
}

