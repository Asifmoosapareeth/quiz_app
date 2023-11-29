import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/Database/database_connetion.dart';
import 'Model/model class.dart';
import 'Screens/HomeScreen.dart';
import 'Screens/Login.dart';


void main() async{
  var db = Dbconnect();
  db.fetchQuestions('Dart');
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCtDloVNoPsIBsxDP1svx_pF-sH1K2iofo",
      projectId: "my-flutterproject-quiz",
      appId: '1:73619817305:android:b55d7b7a19f7165acc8248',
      messagingSenderId: '',
    ),);
  Categoryname dartCategory = Categoryname(id: '1', name: 'Dart');
  await db.addCategory(dartCategory);

  User? user = FirebaseAuth.instance.currentUser;
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: user==null ? LoginFire():HomeScreen(),));

}

