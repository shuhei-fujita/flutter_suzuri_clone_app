import 'package:flutter/material.dart';
import 'package:flutter_hands_on/pages/page_login.dart';
import 'package:firebase_auth/firebase_auth.dart';

class PageProfile extends StatelessWidget {

  final _auth = FirebaseAuth.instance;
//  String email;
//  String password;

  void getCurrentUser() async {
    final user = await _auth.currentUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: RaisedButton(
            child: Text("ログイン"),
            color: Colors.blue,
            textColor: Colors.white,
            onPressed: (){
              Navigator.push(context,
                MaterialPageRoute(builder: (context) => PageLogin()),
              );
            }
        ),
      ),
    );
  }
}
