import 'package:flutter/material.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailCtrl = TextEditingController();
  String image = "https://placehold.it/200";

  void changeImage() {
    setState(() {
      image = gravatar(emailCtrl.text, 200);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(60),
        color: Colors.deepPurple,
        child: ListView(
          children: <Widget>[
            Container(
              width: 200,
              height: 200,
              child: Image.network(image),
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
                border: Border.all(
                  width: 4.0,
                  color: const Color(0xFFFFFFFF),
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(200),
                ),
              ),
            ),
            Text(image),
            SizedBox(
              height: 60,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: "E-mail",
                labelStyle: TextStyle(color: Colors.white),
              ),
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
              controller: emailCtrl,
              onEditingComplete: changeImage,
            ),
            FlatButton(
              child: Text("Update"),
              onPressed: changeImage,
            )
          ],
        ),
      ),
    );
  }
}

String gravatar(String email, int size) {
  var bytes = utf8.encode(email);
  var digest = md5.convert(bytes);
  var url = "https://www.gravatar.com/avatar/$digest?s=$size";
  return url;
}
