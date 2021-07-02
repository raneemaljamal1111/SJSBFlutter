import 'package:flutter/material.dart';
import 'package:project2/Widget/Auth_Folder.dart';
import 'package:project2/register.dart';
class login extends StatefulWidget {
  static const routNamed = '111';

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 400,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      bottomRight: Radius.circular(100))),
              child: Center(
                child: Column(children: [
                  SizedBox(height: 80),
                  Container(
                    height: 300,
                    width: 300,
                    child: Image(
                      image: AssetImage('lib/images/SJSB2.png'),
                      fit: BoxFit.fill,
                      alignment: Alignment.bottomCenter,
                    ),
                  ),
                ]),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Form(
              child: Stack(
                children: [
                  AuthFolder(),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 5,
            ),
            FlatButton(
              child: Text(
                'Don\'t have an account?',
                style: TextStyle(color: Colors.black54, fontSize: 20),
              ),
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => register()));              },
            ),
          ],
        ),
      ),
    );
  }
}
