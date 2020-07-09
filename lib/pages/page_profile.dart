import 'package:flutter/material.dart';
import 'package:flutter_hands_on/pages/page_user_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_hands_on/pages/page_user_sign_up.dart';

class PageProfile extends StatelessWidget {

  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;
//  String email;
//  String password;

  void getCurrentUser() async {
    try {
      final user = await _auth.currentUser();

      if(user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {

    getCurrentUser();

    return Scaffold(
      body: Center(
        child: RaisedButton(
            child: Text("ログイン"),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: (){
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => PageUserSignIn()),
              );
            }
        ),
      ),
    );
  }
}
