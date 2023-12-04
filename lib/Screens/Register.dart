import 'package:flutter/material.dart';
import '../Constants/constants.dart';
import '../Database/firebase_auth.dart';
import 'Login.dart';

class RegistrationFire extends StatefulWidget {
  const RegistrationFire({Key? key}) : super(key: key);

  @override
  State<RegistrationFire> createState() => _RegistrationFireState();
}

class _RegistrationFireState extends State<RegistrationFire> {
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

                      FirebaseHelper().register(useremail: email, password: pass).then((result) {
                        if (result == null) {
                          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginFire()));
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(result)));
                        }
                      });
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.white,
                      onPrimary: orangee,
                      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                    ),
                    child: Text('Register here', style: TextStyle(fontSize: 18)),
                  ),
                  SizedBox(height: 15),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginFire()));
                    },
                    style: TextButton.styleFrom(
                      primary: Colors.white,
                    ),
                    child: Text('Already have an account? Login', style: TextStyle(fontSize: 16)),
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
