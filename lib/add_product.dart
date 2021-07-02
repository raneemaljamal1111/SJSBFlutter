import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project2/Widget/products.dart';
import 'package:project2/veiwPro.dart';

class AddProduct extends StatefulWidget {
  const AddProduct({Key key}) : super(key: key);
  static const routNamed = "add_product";

  @override
  AddProductState createState() => AddProductState();
}

final productKey = GlobalKey<FormState>();

class AddProductState extends State<AddProduct> {
  Products p = Products();
  String code = "";
  String images = "";
  String titles = "";
  String descriptions = "";

  String prices = "";
  String quantitys = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Form(
                key: productKey,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Name',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                          width: double.infinity,
                          height: 40,
                          decoration: BoxDecoration(
                            borderRadius: new BorderRadius.circular(2.0),
                          ),
                          child: TextFormField(
                              onChanged: (l) {
                                setState(() {
                                  titles = l;
                                });
                              },
                              validator: (value) => value.isEmpty ? "Enter name" : null,
                              cursorColor: Colors.black,
                              decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(8)), borderSide: BorderSide(color: Colors.black)),
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(8)), borderSide: BorderSide(color: Colors.black)),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.all(Radius.circular(8)), borderSide: BorderSide(color: Colors.black)),
                                labelText: 'Name',
                                labelStyle: TextStyle(fontSize: 13),
                              ))),
                      SizedBox(
                        height: 16,
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          ' Description',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: new BorderRadius.circular(2.0),
                        ),
                        child: TextFormField(
                            onChanged: (value) {
                              setState(() {
                                descriptions = value;
                              });
                            },
                            validator: (value) => value.isEmpty ? "Enter description" : null,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              focusedBorder:
                                  OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8)), borderSide: BorderSide(color: Colors.black)),
                              enabledBorder:
                                  OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8)), borderSide: BorderSide(color: Colors.black)),
                              border:
                                  OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8)), borderSide: BorderSide(color: Colors.black)),
                              labelText: ' Description',
                              labelStyle: TextStyle(fontSize: 13),
                            )),
                      ),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          'Image or video',
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                        width: double.infinity,
                        height: 40,
                        decoration: BoxDecoration(
                          borderRadius: new BorderRadius.circular(2.0),
                        ),
                        child: TextFormField(
                            onChanged: (l) {
                              setState(() {
                                images = l;
                              });
                            },
                            validator: (value) => value.isEmpty ? "Enter Image or video" : null,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              focusedBorder:
                                  OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8)), borderSide: BorderSide(color: Colors.black)),
                              enabledBorder:
                                  OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8)), borderSide: BorderSide(color: Colors.black)),
                              border:
                                  OutlineInputBorder(borderRadius: BorderRadius.all(Radius.circular(8)), borderSide: BorderSide(color: Colors.black)),
                              labelText: 'Product Image or video',
                              labelStyle: TextStyle(fontSize: 13),

                            )),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 16,
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    ' Quantity',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: new BorderRadius.circular(2.0),
                                  ),
                                  child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      onChanged: (value) {
                                        setState(() {
                                          quantitys = value;
                                        });
                                      },
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(8)), borderSide: BorderSide(color: Colors.black)),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(8)), borderSide: BorderSide(color: Colors.black)),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(8)), borderSide: BorderSide(color: Colors.black)),
                                        labelText: 'Quantity',
                                        labelStyle: TextStyle(fontSize: 13),
                                      )),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 16,
                                ),
                                Align(
                                  alignment: Alignment.bottomLeft,
                                  child: Text(
                                    'Price',
                                    style: TextStyle(fontSize: 15),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  width: double.infinity,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    borderRadius: new BorderRadius.circular(2.0),
                                  ),
                                  child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      onChanged: (l) {
                                        setState(() {
                                          prices = l;
                                        });
                                      },
                                      validator: (value) => value.isEmpty ? "Enter price" : null,
                                      cursorColor: Colors.black,
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(8)), borderSide: BorderSide(color: Colors.black)),
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(8)), borderSide: BorderSide(color: Colors.black)),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(Radius.circular(8)), borderSide: BorderSide(color: Colors.black)),
                                        labelText: 'Price',
                                        labelStyle: TextStyle(fontSize: 13),
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                Container(
                  height: 50,
                  width: 180,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.indigo,
                      onPrimary: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(2.0),
                      ),
                    ),
                    child: Text("ok"),
                    onPressed: () async {
                      if (productKey.currentState.validate()) {
                        p.add(price: prices, Quantity: quantitys, description: descriptions, title: titles, image: images,uid:FirebaseAuth.instance.currentUser.uid);//if(
                        Navigator.pushNamed(context, HomePage.routNamed);
                      }
                    },
                  ),
                ),
                Container(
                  height: 50,
                  width: 180,
                  child: TextButton(
                    style: ButtonStyle(
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(color: Colors.indigo)))),
                    child: Text("cancel"),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  ),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
