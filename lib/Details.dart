import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:project2/Widget/products.dart';

class Details extends StatefulWidget {
  static const routNamed = '/Details';

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int Quantity = 1;

  @override
  Widget build(BuildContext context) {
    Products p = Products();
    final Product pro = ModalRoute.of(context).settings.arguments;
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              decoration: BoxDecoration(
                  color: Color(0xEEBCEEEE),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  )),
              height: 360,
            ),
            Column(children: [
              Container(
                height: 288,
                width: double.infinity,
                child:
                Image(
                  image: NetworkImage(pro.image),
                  fit: BoxFit.fill,
                  alignment: Alignment.bottomLeft,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                pro.title,
                style: TextStyle(fontSize: 20),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "Price:" + pro.price.toString() + " JD",
                style: TextStyle(
                  fontSize: 15,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                alignment: Alignment.center,
                height: 50,
                width: 350,
                color: pro.color,
                child: Container(
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () {
                          setState(() {
                            Quantity = Quantity + 1;
                          });
                        },
                        icon: Icon(
                          Icons.add,
                          color: Colors.grey,
                        ),
                      ),
                      Text(
                        Quantity.toString(),
                        style: TextStyle(color: Colors.grey),
                      ),
                      FlatButton(
                        onPressed: () {
                          setState(() {
                            if (Quantity != 1) Quantity = Quantity - 1;
                          });
                        },
                        child: Text(
                          '-',
                          style: TextStyle(fontSize: 40, color: Colors.grey),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 150,
              ),
              Padding(
                padding: EdgeInsets.only(top: 70),
                child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                        color: pro.color,
                        borderRadius: BorderRadius.all(
                          Radius.circular(800),
                        )),
                    alignment: Alignment.bottomCenter,
                    child: FlatButton(
                        onPressed: () {
                          p.add_to_basket(image: pro.image, price: pro.price, Quantity: Quantity.toString(), title: pro.title);
                          Navigator.pop(context);
                        },
                        child: Icon(
                          Icons.add_shopping_cart,
                          color: Colors.grey,
                        ))),
              )
            ]),
          ],
        ),
      ),
    );
  }
  bool isYoutube(String url) {
    final regex = RegExp(r'.*\?v=(.+?)($|[\&])', caseSensitive: false, multiLine: false);
    return regex.hasMatch(url);
  }
}
