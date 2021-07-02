import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class category extends StatefulWidget {
  static const routNamed = 'l';

  @override
  _categoryState createState() => _categoryState();
}

class _categoryState extends State<category> {
  @override
  List<cardData> Data = [];

  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
            top: BorderSide(width: 10, color: Colors.white10),
            bottom: BorderSide(width: 10, color: Colors.white10),
          )),
      height: 250,
      margin: EdgeInsets.only(
        top: 8,
        left: 1,
        right: 1,
        bottom: 10,
      ),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: Data.length,
        itemBuilder: (context, index) {
          ScrollPhysics(parent: AlwaysScrollableScrollPhysics());

          // ignore: deprecated_member_use
          return FlatButton(
            onPressed: () {},
            child: Card(
              color: Colors.white70,
              child: Stack(
                children: [
                  Column(children: [
                    Text(Data[index].txt),
                    Data[index].img,
                  ])
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class cardData {
  Image img;
  SizedBox s = SizedBox(
    height: 10,
    width: 10,
  );
  String txt;

  cardData(this.img, this.txt);
}
