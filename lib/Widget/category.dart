import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:project2/Widget/products.dart';

class Categories extends StatefulWidget {
  @override
  _CategoriesState createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  List<String> categories = ["Furniture", "Food", "Clothes", "Crafts"];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30),
      child: SizedBox(
        height: 50,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategory(index),
        ),
      ),
    );
  }

  final Products S = Products();
  Widget buildCategory(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
          if (selectedIndex != null && selectedIndex == 0) {
          } else if (selectedIndex == 1) {
          } else if (selectedIndex == 2) {
          } else if (selectedIndex == 3) {}
        });
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              categories[index],
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: selectedIndex == index ? Colors.black45 : Colors.black38,
              ),
            ),
            Container(
              height: 5,
              width: 20,
              color: selectedIndex == index ? Colors.black : Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
