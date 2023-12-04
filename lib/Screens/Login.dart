import 'package:flutter/material.dart';
import 'package:quiz_app/Constants/constants.dart';
import '../Database/firebase_auth.dart';
import 'HomeScreen.dart';
import 'Register.dart';

class LoginFire extends StatefulWidget {
  const LoginFire({Key? key}) : super(key: key);

  @override
  State<LoginFire> createState() => _LoginFireState();
}

class _LoginFireState extends State<LoginFire> {
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        elevation: 0,
      ),
      body: Container(
        color: Colors.lightBlueAccent,
        child: Center(
          child: Container(
            width: 380.0,
            height: 500.0,
            decoration: BoxDecoration(
              color: orangee,
              borderRadius: BorderRadius.circular(20.0),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Quiz App',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Username',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.person, color: Colors.white),
                    ),
                    style: TextStyle(color: Colors.white),
                    controller: usernameController,
                  ),
                  SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.lock, color: Colors.white),
                    ),
                    obscureText: true,
                    style: TextStyle(color: Colors.white),
                    controller: passwordController,
                  ),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      String email = usernameController.text.trim();
                      String pass = passwordController.text.trim();

                      FirebaseHelper().login(email: email, password: pass).then((result) {
                        if (result == null) {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen()));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result)));
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white, // Button color
                      onPrimary: orangee, // Text color
                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                    ),
                    child: Text('Login', style: TextStyle(fontSize: 18)),
                  ),
                  SizedBox(height: 15),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegistrationFire()));
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.white, // Text color
                    ),
                    child: Text('Register', style: TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
