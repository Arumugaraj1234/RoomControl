import 'package:flutter/material.dart';
import 'package:roomcontrol/models/light_model.dart';
import 'package:roomcontrol/support_files/constants.dart';

class LightTypeCards extends StatelessWidget {
  final LightModel lightModel;

  LightTypeCards({@required this.lightModel});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: 50.0,
          width: 130.0,
          decoration: BoxDecoration(
              color: lightModel.bgColor,
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                children: <Widget>[
                  Container(
                    width: 50.0,
                    child: Image.asset(lightModel.iconName),
                  ),
                  Text(
                    lightModel.title,
                    style: kBoldTextStyle.copyWith(
                        color: lightModel.textColor, fontSize: 12.0),
                  )
                ],
              ),
            ),
          ),
        ),
        Container(
          width: 15.0,
        )
      ],
    );
  }
}
