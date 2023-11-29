
class Question{
  final String id;
  final String title;
  final Map<String,bool> options;
  // final String Category_name;

  Question( {required this.id,required this.title, required this.options});

  @override
  String toString() {
    return 'Question(id:$id,title:$title,options:$options)';

  }
}
class Categoryname{
  final String id;
  final String name;
  Categoryname( {required this.id,required this.name});

  @override
  String toString() {
    return 'Question(id:$id,title:$name)';

  }
}