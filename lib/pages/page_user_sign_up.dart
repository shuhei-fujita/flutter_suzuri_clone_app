import 'package:flutter/material.dart';
import 'package:flutter_hands_on/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_hands_on/pages/page_profile.dart';
import 'package:flutter_hands_on/pages/page_user_sign_in.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

class PageUserSignUp extends StatelessWidget {

  final _auth = FirebaseAuth.instance;
  String email;
  String password;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: new
        Scaffold(
      appBar: AppBar(
        title: const Text(
          "ユーザー登録",
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
        leading:
        IconButton(
            icon: Icon(Icons.arrow_back),
            color: Colors.black,
            onPressed: () {
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => PageUserSignIn()),
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
                RaisedButton(
                    child: Text("ユーザー登録"),
                    color: Colors.blueAccent,
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

//                  Navigator.push(context,
//                    MaterialPageRoute(builder: (context) => PageLogin()),
//                  );
                    }
                ),
//            Text("または"),
//            RaisedButton(
//                child: Text("Twitterでログイン"),
//                color: Colors.blue,
//                textColor: Colors.white,
//                onPressed: (){
//                  Navigator.push(context,
//                    MaterialPageRoute(builder: (context) => PageLogin()),
//                  );
//                }
//            ),
              ],
            ),
          ),
        ),
    ),
      );
  }
}
