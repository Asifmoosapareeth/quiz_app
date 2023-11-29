import 'package:flutter/material.dart';
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
        title: Text('Log in'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: Image.asset(
                "assets/images/Quiz.png",
                height: 100.0,
              ),
            ),
            TextField(
              decoration: InputDecoration(
                labelText: 'Username',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.person),
              ),
              controller: usernameController,
            ),
            SizedBox(height: 10),
            TextField(
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.lock),
              ),
              obscureText: true,
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
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
                child: Text('Login', style: TextStyle(fontSize: 18)),
              ),
            ),
            SizedBox(height: 15),
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegistrationFire()));
              },
              child: Text('Register', style: TextStyle(fontSize: 16, color: Colors.blue)),
            ),
          ],
        ),
      ),
    );
  }
}
