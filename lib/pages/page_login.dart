import 'package:flutter/material.dart';

class PageLogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ログイン"),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            TextField(),
            TextField(),
            RaisedButton(
                child: Text("ログイン"),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PageLogin()),
                  );
                }
            ),
            Text("または"),
            RaisedButton(
                child: Text("Twitterでログイン"),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: (){
                  Navigator.push(context,
                    MaterialPageRoute(builder: (context) => PageLogin()),
                  );
                }
            ),
          ],
        ),
      ),
    );
  }
}
