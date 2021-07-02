
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:project2/login.dart';


class LoginSignuporout {

  void loginwithEP(String email, String password) async {

    var user = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email, password: password) ;
    if(user!=null){

    }
    // ignore: deprecated_member_use

  }

  void signupwithEP(String email, String password) async {
     await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email, password: password)
        ; // ignore: deprecated_member_use
  }

final FirebaseAuth _auth = FirebaseAuth.instance;

  void signOut() {
    FirebaseAuth.instance.signOut();
    var user; // ignore: deprecated_member_use
    user = FirebaseAuth.instance.currentUser; // ignore: deprecated_member_use
    //print('$user');
    runApp(
        new MaterialApp(
          home: login()
        )

    );
}}


