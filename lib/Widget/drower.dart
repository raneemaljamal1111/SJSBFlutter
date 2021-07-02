
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project2/add_product.dart';
import 'package:project2/add_to_basket.dart';
import 'package:project2/data.dart';
import 'package:project2/login.dart';
import 'package:project2/my_products.dart';

import 'package:project2/veiwPro.dart';

class MyDrawer extends StatelessWidget {
  LoginSignuporout Auth = LoginSignuporout();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 6,
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          SizedBox(
            height: 30,
          ),
          ListTile(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(HomePage.routNamed);
            },
            leading: Icon(Icons.home, color: Colors.black45),
            title: Text(
              'Home',
              style: TextStyle(fontSize: 15, color: Colors.black45),
            ),
          ),ListTile(
            onTap: () {
              Navigator.of(context).pushReplacementNamed(my_pro.routNamed);
            },
            leading: Icon(Icons.shopping_bag, color: Colors.black45),
            title: Text(
              'My Product',
              style: TextStyle(fontSize: 15, color: Colors.black45),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, Basket.routNamed);
            },
            leading: Icon(Icons.shopping_cart_sharp, color: Colors.black45),
            title: Text(
              'My basket',
              style: TextStyle(fontSize: 15, color: Colors.black45),
            ),
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, AddProduct.routNamed);
            },
            leading: Icon(Icons.add_circle, color: Colors.black45),
            title: Text(
              'Add product',
              style: TextStyle(fontSize: 15, color: Colors.black45),
            ),
          ),
          Expanded(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: ListTile(
                onTap: () {
                  Auth.signOut();
                  Navigator.pushNamed(context, login.routNamed);
                },
                leading: Icon(
                  Icons.exit_to_app,
                  color: Colors.black45,
                ),
                title: Text(
                  'Logout',
                  style: TextStyle(fontSize: 15, color: Colors.black45),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
