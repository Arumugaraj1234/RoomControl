import 'package:flutter/material.dart';
import 'package:roomcontrol/support_files/constants.dart';

class ScenesCard extends StatelessWidget {
  final String title;
  final Color startColor;
  final Color endColor;

  ScenesCard({this.title, this.startColor, this.endColor});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                startColor,
                endColor,
              ],
              begin: const FractionalOffset(0.0, 0.5),
              end: const FractionalOffset(1, 0.5),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
          borderRadius: BorderRadius.all(Radius.circular(10.0))),
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Row(
          children: <Widget>[
            Container(
              width: 50.0,
              child: Image.asset('images/teal_bulb.png'),
            ),
            Text(
              title,
              style: kBoldTextStyle.copyWith(fontSize: 16.0),
            )
          ],
        ),
      ),
    );
  }
}
