import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Screens/HomeScreen.dart';
import 'Screens/Login.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: "AIzaSyCtDloVNoPsIBsxDP1svx_pF-sH1K2iofo",
      projectId: "my-flutterproject-quiz",
      appId: '1:73619817305:android:b55d7b7a19f7165acc8248',
      messagingSenderId: '',
    ),);
  User? user = FirebaseAuth.instance.currentUser;
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home:
    user==null ? const LoginFire():
    const HomeScreen(),
    theme: ThemeData(
      primaryColor: Colors.orange,
      fontFamily: 'Montserrat',
      appBarTheme: const AppBarTheme(
        elevation: 0,
        centerTitle: true,
      ),
    ),

  ));

}

