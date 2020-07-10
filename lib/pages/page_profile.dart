import 'package:flutter/material.dart';
import 'package:flutter_hands_on/main.dart';
import 'package:flutter_hands_on/pages/page_user_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_hands_on/pages/page_user_sign_up.dart';

class PageProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return PageProfileStateful();
  }

}

class PageProfileStateful extends StatefulWidget {
  @override
  _PageProfileState createState() => new _PageProfileState();
}

class _PageProfileState extends State {

  final _auth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;
  FirebaseUser loggedInUser;
  Firestore fireCollection;
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

  void signOut() {
    _auth.signOut();
//    FirebaseUser user = _auth.currentUser as FirebaseUser;
  }

  void getUserName() async {
    final uidUsername = await fireCollection.collection("user").getDocuments();
    print(uidUsername.metadata);
    var username = uidUsername;
  }

  @override
  Widget build(BuildContext context) {

    getCurrentUser();
//    final user = _auth.currentUser();

    if(loggedInUser == null) {
      print("ログインしていません");
      return Scaffold(
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
        body: Center(
          child: ButtonTheme(
            minWidth: 300,
            child: RaisedButton(
                child: Text("ログイン"),
                color: Colors.blueAccent,
                textColor: Colors.white,
                onPressed: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PageUserSignIn()),
                  );
                }
            ),
          ),
        ),
      );
    } else {
      getUserName();

      print(loggedInUser.uid + "でログインしています");
      return Scaffold(
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
//                        _auth.signOut();
                        loggedInUser = null;
//                        AppBuilder.of(context).rebuild();
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
//
//    return Scaffold(
//      body: Center(
//        child: ButtonTheme(
//          minWidth: 300,
//          child: RaisedButton(
//              child: Text("ログイン"),
//              color: Colors.blueAccent,
//              textColor: Colors.white,
//              onPressed: (){
//                Navigator.push(context,
//                  MaterialPageRoute(builder: (context) => PageUserSignIn()),
//                );
//              }
//          ),
//        ),
//      ),
//    );
  }
}

