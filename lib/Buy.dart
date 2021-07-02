import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:project2/Widget/orginal.dart';
import 'package:project2/veiwPro.dart';

import 'Widget/products.dart';

class Buy extends StatefulWidget {
  static const routNamed = 'buy';

  @override
  _BuyState createState() => _BuyState();
}

class _BuyState extends State<Buy> {
  double tax = 0.0;
  double total = 0.0;
  double subtotal = 0.0;
  Widget build(BuildContext context) {
    final List<Product> prd = ModalRoute.of(context).settings.arguments;
    prd.forEach((element) {
      tax = 0.14 * double.parse(element.price);
      total = tax + double.parse(element.price);
      double subtotal = double.parse(element.price) * double.parse(element.Quantity);
    });

    String Payment, Name, Billing, Phone, Address, City, Zip, Apartment = "";
    return Scaffold(
      appBar: AppBar(
        title: Center(
            child: Text(
          'check out',
          style: TextStyle(color: Colors.black54),
        )),
        iconTheme: IconThemeData(color: Colors.black45),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: <Widget>[SizedBox(width: 20)],
      ),
      body: SingleChildScrollView(
        child: Form(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      Payment = value;
                    });
                  },
                  validator: (value) => value.length > 14 ? null : 'this is required',
                  decoration: InputDecoration(
                    labelText: 'Add payment method',
                  ),
                  obscureText: true,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      Name = value;
                    });
                  },
                  validator: (value) => value.length > 6 ? null : 'Enter name on card',
                  decoration: InputDecoration(
                    labelText: 'Name on card',
                  ),
                  obscureText: true,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      Billing = value;
                    });
                  },
                  validator: (value) => value.length > 6 ? null : 'this is required ',
                  decoration: InputDecoration(
                    labelText: 'Billing address',
                  ),
                  obscureText: true,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      Apartment = value;
                    });
                  },
                  validator: (value) => value.length > 6 ? null : 'this is required ',
                  decoration: InputDecoration(
                    labelText: 'Apartment',
                  ),
                  obscureText: true,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            City = value;
                          });
                        },
                        validator: (value) => value.length > 0 ? null : 'Enter your City',
                        decoration: InputDecoration(
                          labelText: 'City',
                        ),
                        obscureText: true,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: TextFormField(
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          setState(() {
                            Zip = value;
                          });
                        },
                        validator: (value) => value.length > 5 ? null : 'Enter zip code',
                        decoration: InputDecoration(
                          labelText: 'ZIP code',
                        ),
                        obscureText: true,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  onChanged: (value) {
                    setState(() {
                      Address = value;
                    });
                  },
                  validator: (value) => value.length > 5 ? null : 'Enter your Address',
                  decoration: InputDecoration(
                    labelText: 'Shopping Address',
                  ),
                  obscureText: true,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      Phone = value;
                    });
                  },
                  validator: (value) => value.length > 10 ? null : 'Enter a valid Phone Number',
                  decoration: InputDecoration(
                    labelText: 'Phone',
                  ),
                  obscureText: true,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                    width: .5,
                  )),
                  child: Row(
                    children: [
                      Text("SubTotal: ${total.toStringAsFixed(3)}", style: TextStyle(fontSize: 25)),
                      SizedBox(
                        width: 6,
                        height: 6,
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                    width: .5,
                  )),
                  child: Row(
                    children: [
                      Text("Tax: $tax", style: TextStyle(fontSize: 25)),
                      SizedBox(
                        width: 6,
                        height: 6,
                      ),
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                    width: 0.5,
                  )),
                  child: Row(
                    children: [
                      Text("Shipping:", style: TextStyle(fontSize: 25)),
                      SizedBox(width: 6, height: 6),
                      Text("00", style: TextStyle(fontSize: 25))
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                    width: .5,
                  )),
                  child: Row(
                    children: [
                      Text(
                        "Total:",
                        style: TextStyle(fontSize: 25),
                      ),
                      SizedBox(
                        width: 6,
                        height: 6,
                      ),
                      Text('', style: TextStyle(fontSize: 25))
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: double.infinity,
                  height: 50,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.indigo,
                        onPrimary: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      child: Text("confirm",style: TextStyle(fontSize: 22),),
                      onPressed: () async {
                       /* AlertDialog(title: Text("Thank you",style: TextStyle(fontSize: 22,color: Colors.indigo,),),
                          actions: <Widget>[
                            Container(
                              width: double.infinity/3,
                              height: 30,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    onPrimary: Colors.indigo,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                  ),
                                  child: Text("OK",style: TextStyle(fontSize: 22),),
                                  onPressed: () async {
                                    Navigator.pushNamed(context, HomePage.routNamed);
                                  }
                              ),
                            )
                          ],
                        );*/

                        Navigator.pushNamed(context, HomePage.routNamed);
                      }
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
