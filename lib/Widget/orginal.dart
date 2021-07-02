import 'package:flutter/material.dart';

class orginalButton extends StatelessWidget {
  final String text;
  final VoidCallback onpressed;
  final Color textColor;
  final Color bgColor;

  const orginalButton(
      {Key key, this.text, this.onpressed, this.textColor, this.bgColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
          width: double.infinity,
          height: 50,
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            onPressed: onpressed,
            color: bgColor,
            child: Text(
              text,
              style: TextStyle(color: textColor, fontSize: 22),
            ),
          )),
    );
  }
}
