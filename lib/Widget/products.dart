import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:project2/add_product.dart';

class Product {
  var uid=FirebaseAuth.instance.currentUser.uid;
  final String id, image, title, description, type;
  final String price;
  String Quantity;
  final Color color;

  Product({
    this.uid,
    this.type,
    this.Quantity,
    this.id,
    this.image,
    this.title,
    this.price,
    this.description,
    this.color,
  });

  void addQuantity() {
    var quantity = int.parse(Quantity);
    quantity = quantity + 1;
    Quantity = quantity.toString();
  }


  void removeQuantity() {
    var quantity = int.parse(Quantity);
    if (quantity > 0) {
      quantity = quantity - 1;
    }
  }
}

class Products with ChangeNotifier {
  List<Product> productList = [];
  Future<void> add({String title, String image, String price, String description, String Quantity, String type,String uid}) async {
    WidgetsFlutterBinding.ensureInitialized();

    final String url = 'https://fire-53c93-default-rtdb.firebaseio.com/product/.json';

    http
        .post(Uri.parse(url),
            body: json.encode({
              "type": type,
              "title": title,
              "image": image,
              "price": price,
              "description": description,
              "Quantity": Quantity,
              "uid": uid,
            }))
        .then((res) {
      productList.add(Product(
        type: type,
        id: json.decode(res.body)['name'],
        title: title,
        image: image,
        price: price,
        description: description,
        Quantity: Quantity,
      ));
    });
  }

  Future<void> add_to_basket({String title, String image, String price, String Quantity}) async {
    WidgetsFlutterBinding.ensureInitialized();

    final String url = 'https://fire-53c93-default-rtdb.firebaseio.com/basket.json';

    http
        .post(Uri.parse(url),
            body: json.encode({
              "title": title,
              "image": image,
              "price": price,
              "Quantity": Quantity,
            }))
        .then((res) {
      productList.add(Product(
        id: json.decode(res.body)['name'],
        title: title,
        image: image,
        price: price,
        Quantity: Quantity,
      ));
    });
  }

  Future<void> orders({String title, String image, String price, String Quantity}) async {
    WidgetsFlutterBinding.ensureInitialized();

    final String url = 'https://sjsb-455ed-default-rtdb.firebaseio.com/order.json';

    http
        .post(Uri.parse(url),
            body: json.encode({
              "title": title,
              "image": image,
              "price": price,
              "Quantity": Quantity,
            }))
        .then((res) {
      productList.add(Product(
        id: json.decode(res.body)['name'],
        title: title,
        image: image,
        price: price,
        Quantity: Quantity,
      ));
    });
  }
}
