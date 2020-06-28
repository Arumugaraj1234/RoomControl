import 'package:flutter/material.dart';

class CustomShadowedButton extends StatelessWidget {
  final String buttonTitle;
  final Function onTapped;

  CustomShadowedButton({this.buttonTitle, this.onTapped});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.0,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.teal,
        borderRadius: BorderRadius.all(
          Radius.circular(5.0),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.teal.shade50,
            blurRadius: 7.0,
            spreadRadius: 5.0,
            offset: Offset(-2.0, 5.0),
          )
        ],
      ),
      child: FlatButton(
        onPressed: onTapped,
        child: Text(
          buttonTitle,
          style: TextStyle(
              color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
