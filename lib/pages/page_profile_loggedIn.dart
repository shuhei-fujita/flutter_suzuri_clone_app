import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hands_on/pages/page_profile.dart';

class PageProfileLoggedIn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageProfileLoggedInStateful();
  }
}

class PageProfileLoggedInStateful extends StatefulWidget {
  @override
  _PageProfileLoggedInState createState() => new _PageProfileLoggedInState();
}

class _PageProfileLoggedInState extends State {
  final _auth = FirebaseAuth.instance;
  FirebaseUser loggedInUser;

  void signOut() {
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
      print("ログインしています");
      return Scaffold(
        body: Center(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 300, 0, 100.0),
                child: Text(" ログインしています"),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 100, 0, 0),
                child: ButtonTheme(
                  minWidth: 300,
                  child: RaisedButton(
                      child: Text("ログアウト"),
                      color: Colors.grey,
                      textColor: Colors.white,
                      onPressed: (){
                        signOut();
                        Navigator.push(context,
                          MaterialPageRoute(builder: (context) => PageProfile()),
                        );
                      }
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}

