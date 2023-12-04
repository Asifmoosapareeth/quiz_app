
class Question{
  final String id;
  final String title;
  final Map<String,bool> options;
  final String Category_name;

  Question( {required this.id,required this.title, required this.options, required this.Category_name});

  @override
  String toString() {
    return 'Question(id:$id,title:$title,options:$options,Category_name:$Category_name)';
  }
}
