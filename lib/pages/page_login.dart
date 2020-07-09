import 'package:flutter/material.dart';

class PageLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ログイン"),
      ),
      body: Center(
        child: RaisedButton(
            child: Text("Twitterでログイン"),
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
