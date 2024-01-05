import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quiz_app/Model/model class.dart';
class Dbconnect {

  final String baseUrl = 'https://my-flutterproject-quiz-default-rtdb.asia-southeast1.firebasedatabase.app';

  Future<List<Question>> fetchQuestions(String categoryName) async {
    final questionUrl = Uri.parse('$baseUrl/$categoryName.json');
    print('Fetching questions from URL: $questionUrl');
    final response = await http.get(questionUrl);
    if (response.statusCode == 200) {
      var data = json.decode(response.body) as Map<String, dynamic>;
      List<Question> newQuestions = [];
      data.forEach((key, value) {
        var newQuestion = Question(
          id: key,
          title: value['title'],
          options: Map.castFrom(value['options']),
          Category_name: value['category_name'],
        );
        newQuestions.add(newQuestion);
      });
      return newQuestions;
    } else {
      throw Exception('Failed to load questions');

    }
  }

}
