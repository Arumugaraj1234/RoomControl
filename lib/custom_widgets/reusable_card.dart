import 'package:flutter/material.dart';
import 'package:roomcontrol/support_files/constants.dart';

class ReUsableCard extends StatelessWidget {
  final String imageName;
  final String title;
  final String lightsCount;
  final Function onCardTapped;

  ReUsableCard(
      {@required this.imageName,
      @required this.title,
      @required this.lightsCount,
      @required this.onCardTapped});
  // '  Bed Room'
  //'   4 Lights'
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onCardTapped,
      child: Center(
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Image.asset(imageName),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    title,
                    style: kBoldTextStyle.copyWith(
                        color: Colors.black, fontSize: 18.0),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Text(
                    lightsCount,
                    style: kBoldTextStyle.copyWith(
                        color: Colors.orange, fontSize: 14.0),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
