import 'package:flutter/material.dart';
import 'package:roomcontrol/custom_widgets/reusable_card.dart';
import 'package:roomcontrol/support_files/constants.dart';

class ControlPanelScreenWidget extends StatelessWidget {
  final Function onBedRoomSelected;
  final Function onLivingRoomSelected;
  final Function onKitchenSelected;
  final Function onBathRoomSelected;
  final Function onOutdoorSelected;
  final Function onBalconySelected;

  ControlPanelScreenWidget(
      {@required this.onBedRoomSelected,
      @required this.onLivingRoomSelected,
      @required this.onKitchenSelected,
      @required this.onBathRoomSelected,
      @required this.onOutdoorSelected,
      @required this.onBalconySelected});

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
                        'Control Panel',
                        style: kBoldTextStyle.copyWith(fontSize: 35.0),
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
            flex: 9,
            child: Hero(
              tag: 'cards',
              child: Material(
                type: MaterialType.transparency,
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25.0),
                      topRight: Radius.circular(25.0),
                    ),
                    color: Color(0xFFF4F6FA),
                  ),
                  child: Column(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 25.0),
                        height: 50.0,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'All Rooms',
                            style: kBoldTextStyle.copyWith(
                                color: Colors.black, fontSize: 20.0),
                          ),
                        ),
                      ),
                      Expanded(
                          child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 25.0, vertical: 10.0),
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        child: ReUsableCard(
                                          imageName: 'images/bed.png',
                                          title: '  Bed Room',
                                          lightsCount: '   4 Lignts',
                                          onCardTapped: onBedRoomSelected,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 25.0,
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: ReUsableCard(
                                          imageName: 'images/room.png',
                                          title: '  Living Room',
                                          lightsCount: '   2 Lignts',
                                          onCardTapped: onLivingRoomSelected,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 25.0,
                            ),
                            Expanded(
                              child: Container(
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        child: ReUsableCard(
                                          imageName: 'images/kitchen.png',
                                          title: '  Kitchen',
                                          lightsCount: '   5 Lignts',
                                          onCardTapped: onKitchenSelected,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 25.0,
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: ReUsableCard(
                                          imageName: 'images/bathtube.png',
                                          title: '  Bathroom',
                                          lightsCount: '   1 Lignts',
                                          onCardTapped: onBathRoomSelected,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 25.0,
                            ),
                            Expanded(
                              child: Container(
                                child: Row(
                                  children: <Widget>[
                                    Expanded(
                                      child: Container(
                                        child: ReUsableCard(
                                          imageName: 'images/house.png',
                                          title: '  Outdoor',
                                          lightsCount: '   5 Lignts',
                                          onCardTapped: onOutdoorSelected,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 25.0,
                                    ),
                                    Expanded(
                                      child: Container(
                                        child: ReUsableCard(
                                          imageName: 'images/balcony.png',
                                          title: '  Balcony',
                                          lightsCount: '   2 Lignts',
                                          onCardTapped: onBalconySelected,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ))
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}

//(((MediaQuery.of(context)
//.size
//    .height *
//(9 / 12)) -
//120) /
//3)
