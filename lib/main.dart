import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project2/Details.dart';
import 'package:project2/Widget/Auth_Folder.dart';
import 'package:project2/Widget/pveiwer.dart';
import 'package:project2/add_product.dart';
import 'package:project2/add_to_basket.dart';
import 'package:project2/intro_screen.dart';
import 'package:project2/login.dart';
import 'package:project2/my_products.dart';
import 'package:project2/register.dart';
import 'package:project2/veiwPro.dart';

import 'Buy.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    title: 'SJSB',
    theme: ThemeData(
        hintColor: Colors.blueGrey,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primaryColor: Colors.indigo,
        textTheme: TextTheme(
          headline3: TextStyle(color: Colors.black54),
          headline1: TextStyle(fontSize: 30, color: Colors.white),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white30),
            borderRadius: BorderRadius.circular(25),
          ),
        )),
    debugShowCheckedModeBanner: false,
    initialRoute: introScreen.routNamed,
    routes: {
      my_pro.routNamed: (context) => my_pro(),
      Basket.routNamed: (context) => Basket(),
      AddProduct.routNamed: (context) => AddProduct(),
      AuthFolder.routNamed: (context) => introScreen(),
      introScreen.routNamed: (context) => introScreen(),
      login.routNamed: (context) => login(),
      register.routNamed: (context) => register(),
      Details.routNamed: (context) => Details(),
      Buy.routNamed: (context) => Buy(),
      HomePage.routNamed: (context) => HomePage(),
      category.routNamed: (context) => category(),
    },
  ));
}
