

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project2/login.dart';

import 'Widget/orginal.dart';
class introScreen extends StatelessWidget {
  static const routNamed='/entro';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor:Colors.indigo ,
      body:
      Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [SizedBox(
              height: 60,
              width: double.infinity,
            ),
              Container(width: 500,height: 400,
                  child: Image.asset('lib/images/SJSB2.png',       fit: BoxFit.fill,
              )),
              Container(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    onPrimary: Colors.indigo,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                  child: Text("Get started",style: TextStyle(fontSize: 22),),
                  onPressed: () async {
                      Navigator.pushNamed(context, login.routNamed);
                    }
                ),
              ),
              SizedBox(
                height: 50,
                width: 50,
              )
            ],
          ),
        ),
      ),



    );
  }
}
