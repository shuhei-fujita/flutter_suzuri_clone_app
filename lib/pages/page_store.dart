import 'package:flutter/material.dart';

class PageStore extends StatelessWidget {

  static const routeName = "/tabStore";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Text("カートが空っぽみたい"),
        ),
      ),
    );
  }
}
