
import 'package:flutter/material.dart';
import 'package:quiz_app/Screens/QuestionPage.dart';
import '../Database/database_connetion.dart';
import '../Model/model class.dart'; // Create this screen for displaying questions for a selected category

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final Dbconnect db = Dbconnect();
  late Future<List<Categoryname>> _categories;

  @override
  void initState() {
    _categories = db.fetchCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Quiz App'),
      ),
      body: FutureBuilder(
        future: _categories,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (snapshot.hasData) {
              List<Categoryname> categories = snapshot.data as List<Categoryname>;
              return ListView.builder(
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(categories[index].name),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => QuestionPage(categoryname: categories[index],),
                        ),
                      );
                    },
                  );
                },
              );
            } else {
              return const Center(
                child: Text('No categories available.'),
              );
            }
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
