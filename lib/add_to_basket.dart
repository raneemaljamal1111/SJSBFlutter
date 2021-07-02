import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:project2/Buy.dart';
import 'package:project2/Details.dart';
import 'package:project2/Widget/drower.dart';
import 'package:project2/Widget/orginal.dart';
import 'package:project2/Widget/products.dart';

class Basket extends StatefulWidget {
  const Basket({Key key}) : super(key: key);
  static const routNamed = "basket";

  @override
  _Basket createState() => _Basket();
}

class _Basket extends State<Basket> {
  List<Product> prod = [];

  @override
  void initState() {
    super.initState();
    DatabaseReference proRef = FirebaseDatabase.instance.reference().child("basket");
    proRef.once().then((DataSnapshot snap) {
      var KEYS = snap.value.keys;
      var DATA = snap.value;

      prod.clear();
      for (var individualKey in KEYS) {
        Product product = new Product(
            Quantity: DATA[individualKey]['Quantity'],
            id: DATA[individualKey]['id'],
            image: DATA[individualKey]['image'],
            title: DATA[individualKey]['title'],
            price: DATA[individualKey]['price']);
        prod.add(product);
      }
      setState(() {
        print(prod.length);
      });
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.black45),
          backgroundColor: Colors.white,
          elevation: 0,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.pushNamed(context, Basket.routNamed);
              },
            ),
            SizedBox(width: 20)
          ],
        ),
        drawer: MyDrawer(),
        body: ListView(
          children: [
            new Center(
              child: prod.length == 0
                  ? Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 16,
                          ),
                          Text(
                            'No Products recorded yet',
                          ),
                          SizedBox(
                            height: 16,
                          )
                        ],
                      ),
                    )
                  : Container(
                      height: 500,
                      alignment: Alignment.center,
                      child: new ListView.builder(
                        itemCount: prod.length,
                        itemBuilder: (_, index) {
                          return FlatButton(
                            onPressed: () {

                              Navigator.pushNamed(context, Details.routNamed, arguments: prod[index]);
                            },
                            child: proUI(
                                prod[index].title,
                                prod[index].image,
                                prod[index].price,
                                int.parse(prod[index].Quantity),
                                () => {
                                      setState(() {
                                        prod[index].addQuantity();
                                      })
                                    },
                                () => {
                                      setState(() {
                                        prod[index].removeQuantity();
                                      })
                                    }),
                          );
                        },
                      ),
                    ),
            ),
            prod.length == 0
                ? Container()
                : orginalButton(
                    bgColor: Colors.indigo,
                    onpressed: () {
                      Navigator.pushNamed(context, Buy.routNamed, arguments: prod);
                    },
                    textColor: Colors.white,
                    text: "Check out",
                  )
          ],
        ));
  }

  Widget proUI(String title, String image, String price, int quantity, Function onAddQuantity, Function onRemoveQyantity) {
    return new Card(
      elevation: 10.0,
      margin: EdgeInsets.all(15.0),
      child: new Container(
        padding: new EdgeInsets.all(14.0),
        child: Center(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: new Image.network(
                  image,
                  fit: BoxFit.cover,
                ),
                height: 200,
                width: 400,
                alignment: Alignment.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      onAddQuantity();
                    },
                    icon: Icon(
                      Icons.add,
                      color: Colors.grey,
                    ),
                  ),
                  Text(
                    quantity.toString(),
                    style: TextStyle(color: Colors.grey),
                  ),
                  // ignore: deprecated_member_use
                  FlatButton(
                    onPressed: () {
                      onRemoveQyantity();

                    },
                    child: Text(
                      '-',
                      style: TextStyle(fontSize: 40, color: Colors.grey),
                    ),
                  ),
                ],
              ),
              Text(
                title,
                style: Theme.of(context).textTheme.subtitle1,
                textAlign: TextAlign.center,
              ),
              Text(
                price + "JD",
                style: Theme.of(context).textTheme.subtitle2,
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
