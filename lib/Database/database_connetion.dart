// import 'dart:convert';
// import 'package:http/http.dart' as http;
// import 'package:quiz_app/Model/model%20class.dart';
//
// class Dbconnect {
//   final url = Uri.parse('https://my-flutterproject-quiz-default-rtdb.asia-southeast1.firebasedatabase.app/questions.json');
//   Future<void> addQuestion(Question question)async{
//      http.post(url,body: jsonEncode({
//       'title': question.title,
//       'options':question.options
//     }));
//   }
//
//   Future<List<Question>> fetchQuestions()async {
//    return  http.get(url).then((response){
//       var data= json.decode(response.body) as Map<String,dynamic>;
//       List<Question>newQuestions=[];
//       data.forEach((key, value) {
//         var newQuestion = Question(
//             id: key,
//             title: value['title'],
//             options: Map.castFrom(value['options'])
//         );
//         newQuestions.add(newQuestion);
//       });
//       return newQuestions;
//     });
//
//   }
// }
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:quiz_app/Model/model class.dart';

class Dbconnect {
  final String baseUrl = 'https://my-flutterproject-quiz-default-rtdb.asia-southeast1.firebasedatabase.app';

  Future<void> addQuestion(Question question, String category) async {
    final questionUrl = Uri.parse('$baseUrl/$category/questions.json');
    await http.post(questionUrl, body: jsonEncode({
      'title': question.title,
      'options': question.options,
    }));
  }

  Future<void> addCategory(Categoryname categoryname) async {
    final categoryUrl = Uri.parse('$baseUrl/category.json');
    await http.post(categoryUrl, body: jsonEncode({
      'name': categoryname.name,
    }));
  }

  Future<List<Question>> fetchQuestions(String category) async {
    final questionUrl = Uri.parse('$baseUrl/questions.json');
    final response = await http.get(questionUrl);

    if (response.statusCode == 200) {
      var data = json.decode(response.body) as Map<String, dynamic>;
      List<Question> newQuestions = [];
      data.forEach((key, value) {
        var newQuestion = Question(
          id: key,
          title: value['title'],
          options: Map.castFrom(value['options']),
        );
        newQuestions.add(newQuestion);
      });
      return newQuestions;
    } else {
      throw Exception('Failed to load questions');
    }
  }

  Future<List<Categoryname>> fetchCategories() async {
    final categoryUrl = Uri.parse('$baseUrl/category.json');
    final response = await http.get(categoryUrl);

    if (response.statusCode == 200) {
      var data = json.decode(response.body) as Map<String, dynamic>;
      List<Categoryname> categories = [];
      data.forEach((key, value) {
        var category = Categoryname(id: key, name: value['name']);
        categories.add(category);
      });
      return categories;
    } else {
      throw Exception('Failed to load categories');
    }
  }
}
