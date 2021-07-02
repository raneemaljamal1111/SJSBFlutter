import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:project2/Details.dart';
import 'package:project2/Widget/drower.dart';
import 'package:project2/Widget/products.dart';
import 'package:project2/add_to_basket.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  static const routNamed = "HomePage";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> pro = [];

  @override
  void initState() {
    super.initState();
    DatabaseReference proRef = FirebaseDatabase.instance.reference().child("product");

    proRef.once().then((DataSnapshot snap) {
      var KEYS = snap.value.keys;
      var DATA = snap.value;

      pro.clear();

      for (var individualKey in KEYS) {
        Product product = new Product(
          type: DATA[individualKey]['type'],
          Quantity: DATA[individualKey]['Quantity'],
          id: DATA[individualKey]['id'],
          image: DATA[individualKey]['image'],
          title: DATA[individualKey]['title'],
          price: DATA[individualKey]['price'],
          description: DATA[individualKey]['description'],
          color: DATA[individualKey]['color'],
        );

        pro.add(product);
      }
      setState(() {
        print(pro.length);
      });
    });
  }

  bool isYoutube(String url) {
    final regex = RegExp(r'.*\?v=(.+?)($|[\&])', caseSensitive: false, multiLine: false);
    return regex.hasMatch(url);
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
        body: pro.length == 0
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'No Products recorded yet',
                    ),
                  ],
                ),
              )
            : ListView.builder(
                itemCount: pro.length,
                itemBuilder: (_, index) {
                  return FlatButton(
                    onPressed: () {
                      Navigator.pushNamed(context, Details.routNamed, arguments: pro[index]);
                    },
                    child: Column(
                      children: [
                        isYoutube(pro[index].image)
                            ? Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Text(
                                  '${pro[index].title} - course',
                                  style: Theme.of(context).textTheme.subtitle1,
                                  textAlign: TextAlign.center,
                                ),
                              )
                            : Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Text(
                                  '${pro[index].title} - Product',
                                  style: Theme.of(context).textTheme.subtitle1,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                        isYoutube(pro[index].image)
                            ? Container(
                                child: YoutubePlayer(
                                  controller: YoutubePlayerController(
                                    initialVideoId: YoutubePlayer.convertUrlToId(pro[index].image),
                                    flags: YoutubePlayerFlags(
                                      hideControls: false,
                                      controlsVisibleAtStart: true,
                                      autoPlay: false,
                                      mute: false,
                                    ),
                                  ),
                                  showVideoProgressIndicator: true,
                                  progressIndicatorColor: Colors.amber,
                                ),
                              )
                            : proUI(pro[index].title, pro[index].image, pro[index].price, pro[index].description, pro[index].type),
                        SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  );
                },
              ));
  }

  Widget proUI(String title, String image, String price, String description, String type) {
    return new Card(
      elevation: 10.0,
      child: Column(
        children: <Widget>[
          Container(
            child: new Image.network(
              image,
              fit: BoxFit.cover,
            ),
            alignment: Alignment.center,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Text(
                  description,
                  style: Theme.of(context).textTheme.subtitle2,
                ),
                Text(
                  price + " JD",
                  style: Theme.of(context).textTheme.subtitle2,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
        ],
      ),
    );
  }
}
