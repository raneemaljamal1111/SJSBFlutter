import 'package:flutter/material.dart';
import 'package:project2/login.dart';
import 'package:project2/veiwPro.dart';

import '../data.dart';

class AuthFolder extends StatefulWidget {
  static const routNamed = 'Auth';

  @override
  _AuthFolderState createState() => _AuthFolderState();
}

class _AuthFolderState extends State<AuthFolder> {
  final AuthKey = GlobalKey<FormState>();

  String emailL = '';
  String passwordL = '';

  @override
  Widget build(BuildContext context) {
    LoginSignuporout authL = LoginSignuporout();

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Form(
          key: AuthKey,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                child: TextFormField(
                    onChanged: (l) {
                      setState(() {
                        emailL = l;
                      });
                    },
                    validator: (value) =>
                        value.isEmpty ? 'Enter a valid email' : null,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color: Colors.black)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color: Colors.black)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color: Colors.black)),
                      labelText: 'Enter your email',
                      labelStyle: TextStyle(fontSize: 15),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        passwordL = value;
                      });
                    },
                    validator: (value) =>
                        value.isEmpty ? 'Enter a valid password' : null,
                    cursorColor: Colors.black,
                    obscureText: true,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color: Colors.black)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color: Colors.black)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color: Colors.black)),
                      labelText: 'Enter your password',
                      labelStyle: TextStyle(fontSize: 15),
                    )),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                width: double.infinity / 2,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.indigo,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      "login",
                      style: TextStyle(fontSize: 22),
                    ),
                    onPressed: () async {
                      if (AuthKey.currentState.validate()) {
                        await authL.loginwithEP(emailL, passwordL);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => HomePage()));
                      }
                    }),
              )
            ],
          )),
    );
  }
}

class regesterForm extends StatefulWidget {
  @override
  _regesterFormState createState() => _regesterFormState();
}

class _regesterFormState extends State<regesterForm> {
  @override
  final AuthReg = GlobalKey<FormState>();
  String eemail = "";
  String ppassword = '';

  Widget build(BuildContext context) {
    LoginSignuporout auth = LoginSignuporout();
    bool nxt = false;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Form(
          key: AuthReg,
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                child: TextFormField(
                    onChanged: (l) {
                      setState(() {
                        eemail = l;
                      });
                    },
                    validator: (value) =>
                        value.isEmpty ? 'Enter a valid email' : null,
                    cursorColor: Colors.black,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color: Colors.black)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color: Colors.black)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color: Colors.black)),
                      labelText: 'Email',
                      labelStyle: TextStyle(fontSize: 15),
                    )),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        ppassword = value;
                      });
                    },
                    validator: (value) =>
                        value.length > 6 ? null : 'Enter a valid password',
                    cursorColor: Colors.black,
                    obscureText: true,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color: Colors.black)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color: Colors.black)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color: Colors.black)),
                      labelText: 'Password',
                      labelStyle: TextStyle(fontSize: 15),
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: new BorderRadius.circular(10.0),
                ),
                child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        value = value;
                      });
                    },
                    validator: (value) =>
                        value == ppassword ? null : 'Renter your password',
                    cursorColor: Colors.black,
                    obscureText: true,
                    decoration: InputDecoration(
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color: Colors.black)),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color: Colors.black)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(8)),
                          borderSide: BorderSide(color: Colors.black)),
                      labelText: 'Renter Password',
                      labelStyle: TextStyle(fontSize: 15),
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.indigo,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    child: Text(
                      "Register",
                      style: TextStyle(fontSize: 22),
                    ),
                    onPressed: () async {
                      if (AuthReg.currentState.validate()) {
                        await auth.signupwithEP(eemail, ppassword);
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (BuildContext context) => login()));
                      }
                    }),
              )
            ],
          )),
    );
  }
}
