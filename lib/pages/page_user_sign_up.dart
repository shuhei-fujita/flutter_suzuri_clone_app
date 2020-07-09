import 'package:flutter/material.dart';
import 'package:flutter_hands_on/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_hands_on/pages/page_profile.dart';
import 'package:flutter_hands_on/pages/page_user_sign_in.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:progress_dialog/progress_dialog.dart';

class PageUserSignUp extends StatelessWidget {

  final _auth = FirebaseAuth.instance;
  String username;
  String email;
  String password;

  final _firestore = Firestore.instance;

  ProgressDialog progressDialog;

  @override
  Widget build(BuildContext context) {

    progressDialog = ProgressDialog(context, type: ProgressDialogType.Normal);

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
                  keyboardType: TextInputType.text,
                  onChanged: (value) {
                    username = value;
                  },
                  decoration: InputDecoration(
                    labelText: "ユーザー名",
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.emailAddress,
                  onChanged: (value) {
                    email = value;
                  },
                  decoration: InputDecoration(
                    labelText: "メール",
                  ),
                ),
                TextField(
                  keyboardType: TextInputType.visiblePassword,
                  obscureText: true,
                  onChanged: (value) {
                    password = value;
                  },
                  decoration: InputDecoration(
                    labelText: "パスワード",
                  ),
                ),
                RaisedButton(
                    child: Text("ユーザー登録"),
                    color: Colors.blueAccent,
                    textColor: Colors.white,
                    onPressed: () async {
                      print("email: " + username);
                      print("email: " + email);
                      print("password: " + password);

                      progressDialog.show();

                      try {
                        final newUser = await _auth.createUserWithEmailAndPassword(
                            username: username,
                            email: email,
                            password: password
                        );

                        _firestore.collection("user")
                            .add({
                          "email": email,
                          "password": password,
                          "username": username,
                        });

                        if(newUser != null) {

                          progressDialog.hide();

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
