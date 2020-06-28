import 'package:flutter/material.dart';
import 'package:roomcontrol/support_files/constants.dart';

class HousePanelScreenWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Expanded(
            flex: 3,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 25.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'House Panel',
                        style: kBoldTextStyle.copyWith(fontSize: 40.0),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Align(
                        alignment: Alignment.centerRight,
                        child: Container(
                            height: 120,
                            width: 120.0,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('images/user.png'),
                                  fit: BoxFit.fill,
                                  alignment: Alignment.topRight),
                            ))),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(),
          )
        ],
      ),
    );
  }
}
