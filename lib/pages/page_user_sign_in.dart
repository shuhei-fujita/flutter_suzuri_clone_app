import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_hands_on/pages/page_profile.dart';

class PageUserSignIn extends StatelessWidget {

  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ログイン"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.emailAddress,
              onChanged: (value) {
                email = value;
              },
              decoration: InputDecoration(
                labelText: "Email",
              ),
            ),
            TextField(
              keyboardType: TextInputType.visiblePassword,
              obscureText: true,
              onChanged: (value) {
                password = value;
              },
              decoration: InputDecoration(
                labelText: "Password",
              ),
            ),
            RaisedButton(
                child: Text("ログイン"),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () async {
                  print("email: " + email);
                  print("password: " + password);

                  try {
                    final newUser = await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);

                    if(newUser != null) {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PageProfile()),
                      );
                    }
                  } catch (e) {
                    print(e);
                  }
                }
            ),
          ],
        ),
      ),
    );
  }
}
