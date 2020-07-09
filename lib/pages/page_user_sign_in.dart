import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_hands_on/main.dart';
import 'package:flutter_hands_on/pages/page_profile.dart';
import 'package:flutter_hands_on/pages/page_user_sign_up.dart';

class PageUserSignIn extends StatelessWidget {

  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: new
    Scaffold(
      appBar: AppBar(
        title: const Text(
          "ログイン",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading:
          IconButton(
              icon: Icon(Icons.arrow_back),
              color: Colors.black,
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              }
          ),
      ),
      body: Card(
        margin: EdgeInsets.all(30.0),
        child: Padding(
          padding: const EdgeInsets.all(30.0),
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
              ButtonTheme(
                minWidth: 300,
                child: RaisedButton(
                    child: Text("ログイン"),
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    onPressed: () async {
                      print("email: " + email);
                      print("password: " + password);

                      try {
                        final user = await _auth.signInWithEmailAndPassword(
                            email: email, password: password);

                        if(user != null) {
                          Navigator.push(context,
                            MaterialPageRoute(builder: (context) => MyApp()),
//                        MaterialPageRoute(builder: (context) => MyHomePage()),
//                        MaterialPageRoute(builder: (context) => PageProfile()),
                          );
                        }
                      } catch (e) {
                        print(e);
                      }
                    }
                ),
              ),
              Text("または"),
              FlatButton(
                child: Center(
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Icon(Icons.person_add),
                      Text(
                        "　ユーザー登録",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                onPressed: () {
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PageUserSignUp()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }
}
