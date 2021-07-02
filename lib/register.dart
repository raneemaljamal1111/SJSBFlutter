import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project2/login.dart';

import 'Widget/Auth_Folder.dart';

class register extends StatefulWidget {
  static const routNamed = 'g';

  @override
  _registerState createState() => _registerState();
}

class _registerState extends State<register> {
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
                  color: Colors.indigo, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100), bottomRight: Radius.circular(100))),
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
                  regesterForm(),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 5,
            ),
            // ignore: deprecated_member_use
            FlatButton(
              child: Text(
                'you have an account',
                style: TextStyle(color: Colors.black54, fontSize: 20),
              ),
              onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (BuildContext context) => login()));
              },
            ),
          ],
        ),
      ),
    );
  }
}
