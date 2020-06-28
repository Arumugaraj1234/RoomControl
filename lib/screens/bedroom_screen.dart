import 'package:flutter/material.dart';
import 'package:roomcontrol/custom_widgets/color_balls.dart';
import 'package:roomcontrol/custom_widgets/light_type_cards.dart';
import 'package:roomcontrol/custom_widgets/scenes_card.dart';
import 'package:roomcontrol/models/light_model.dart';
import 'package:roomcontrol/support_files/auth_services.dart';
import 'package:roomcontrol/support_files/constants.dart';

class BedRoomScreen extends StatefulWidget {
  static const String id = 'bedroom_screen';
  @override
  _BedRoomScreenState createState() => _BedRoomScreenState();
}

class _BedRoomScreenState extends State<BedRoomScreen>
    with SingleTickerProviderStateMixin {
  List<LightTypeCards> getLightTypeList() {
    List<LightTypeCards> result = [];
    for (LightModel light in AuthService.shared.lights) {
      LightTypeCards card = LightTypeCards(lightModel: light);
      result.add(card);
    }
    return result;
  }

  double abc = 1.0;
  Color _aColor = Colors.orange;
  Color _bShadowColor = Colors.orange.shade50;

  AnimationController _controller;
  Animation _animation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));
    _controller.forward();
    _animation = CurvedAnimation(parent: _controller, curve: Curves.decelerate);
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: kBgView,
        child: SafeArea(
          child: Container(
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 4,
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 5,
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 25.0),
                            child: Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                      child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            '← Bed Room',
                                            style: kBoldTextStyle.copyWith(
                                                fontSize: 35.0),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 15.0,
                                        ),
                                        Container(
                                          height: 0 + (50 * _controller.value),
                                          child: Text(
                                            '4 Lights',
                                            style: kBoldTextStyle.copyWith(
                                                color: Colors.orange.shade200,
                                                fontSize: 20.0),
                                          ),
                                        )
                                      ],
                                    ),
                                  )),
                                ),
                                Expanded(
                                  child: Container(
                                    child: Center(
                                      child: Column(
                                        children: <Widget>[
                                          Container(
                                            width: 4.0,
                                            color: Colors.white,
                                            height:
                                                50.0 + (30 * _controller.value),
                                          ),
                                          Container(
                                            width: 120.0,
                                            height: 50.0,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.only(
                                                    topRight:
                                                        Radius.circular(40.0),
                                                    topLeft:
                                                        Radius.circular(40.0))),
                                          ),
                                          Container(
                                            width: 30.0,
                                            height: 15.0,
                                            decoration: BoxDecoration(
                                              color: _aColor.withOpacity(abc),
                                              borderRadius: BorderRadius.only(
                                                bottomLeft:
                                                    Radius.circular(15.0),
                                                bottomRight:
                                                    Radius.circular(15.0),
                                              ),
                                              boxShadow: [
                                                BoxShadow(
                                                  color: _bShadowColor
                                                      .withOpacity(abc),
                                                  blurRadius: 7.0,
                                                  spreadRadius: 3.0,
                                                  offset: Offset(0.0, 3.0),
                                                )
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Container(
                            child: Container(
                              margin: EdgeInsets.only(left: 25.0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    width: (MediaQuery.of(context).size.width -
                                            25) -
                                        ((MediaQuery.of(context).size.width -
                                                25) *
                                            _controller.value),
                                  ),
                                  Expanded(
                                    child: Center(
                                      child: Container(
                                        height: 45.0,
                                        child: ListView(
                                          scrollDirection: Axis.horizontal,
                                          children: List.generate(
                                              AuthService.shared.lights.length,
                                              (int index) {
                                            return LightTypeCards(
                                              lightModel: AuthService
                                                  .shared.lights[index],
                                            );
                                          }),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
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
                            color: Colors.white),
                        child: Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 25.0, vertical: 25.0),
                          child: Column(
                            children: <Widget>[
                              Expanded(
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      Expanded(
                                        child: Container(
                                          child: Column(
                                            children: <Widget>[
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  'Intensity',
                                                  style:
                                                      kBoldTextStyle.copyWith(
                                                          color: Colors.black,
                                                          fontSize: 18.0),
                                                ),
                                              ),
                                              Expanded(
                                                  child: Container(
                                                child: Row(
                                                  children: <Widget>[
                                                    Image.asset(
                                                        'images/dim_bulb.png'),
                                                    Expanded(
                                                      child: SliderTheme(
                                                        data: SliderTheme.of(context).copyWith(
                                                            activeTrackColor:
                                                                Colors.orange,
                                                            thumbColor:
                                                                Colors.orange,
                                                            overlayColor: Colors
                                                                .orange.shade50,
                                                            inactiveTrackColor:
                                                                Colors.grey,
                                                            trackHeight: 1.0,
                                                            thumbShape:
                                                                RoundSliderThumbShape(
                                                                    enabledThumbRadius:
                                                                        10.0),
                                                            overlayShape:
                                                                RoundSliderOverlayShape(
                                                                    overlayRadius:
                                                                        15.0)),
                                                        child: Slider(
                                                          value: abc,
                                                          onChanged: (double
                                                              newValue) {
                                                            setState(() {
                                                              abc = newValue;
                                                              print(newValue);
                                                            });
                                                          },
                                                          min: 0.0,
                                                          max: 1.0,
                                                        ),
                                                      ),
                                                    ),
                                                    Image.asset(
                                                        'images/bright_bulb.png'),
                                                  ],
                                                ),
                                              ))
                                            ],
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Column(
                                            children: <Widget>[
                                              Align(
                                                alignment: Alignment.centerLeft,
                                                child: Text(
                                                  'Colors',
                                                  style:
                                                      kBoldTextStyle.copyWith(
                                                          color: Colors.black,
                                                          fontSize: 18.0),
                                                ),
                                              ),
                                              Expanded(
                                                child: Container(
                                                  child: Row(
                                                    children: <Widget>[
                                                      ColorBalls(
                                                        color: Colors.green,
                                                        onSelected: () {
                                                          setState(() {
                                                            _aColor =
                                                                Colors.green;
                                                            _bShadowColor =
                                                                Colors.green
                                                                    .shade50;
                                                          });
                                                        },
                                                      ),
                                                      SizedBox(
                                                        width: 15.0,
                                                      ),
                                                      ColorBalls(
                                                        color: Colors.deepOrange
                                                            .shade300,
                                                        onSelected: () {
                                                          setState(() {
                                                            _aColor = Colors
                                                                .deepOrange
                                                                .shade300;
                                                            _bShadowColor =
                                                                Colors
                                                                    .deepOrange
                                                                    .shade50;
                                                          });
                                                        },
                                                      ),
                                                      SizedBox(
                                                        width: 15.0,
                                                      ),
                                                      ColorBalls(
                                                        color: Colors.blueGrey,
                                                        onSelected: () {
                                                          setState(() {
                                                            _aColor =
                                                                Colors.blueGrey;
                                                            _bShadowColor =
                                                                Colors.blueGrey
                                                                    .shade50;
                                                          });
                                                        },
                                                      ),
                                                      SizedBox(
                                                        width: 15.0,
                                                      ),
                                                      ColorBalls(
                                                        color: Colors.deepPurple
                                                            .shade300,
                                                        onSelected: () {
                                                          setState(() {
                                                            _aColor = Colors
                                                                .deepPurple
                                                                .shade300;
                                                            _bShadowColor =
                                                                Colors
                                                                    .deepPurple
                                                                    .shade50;
                                                          });
                                                        },
                                                      ),
                                                      SizedBox(
                                                        width: 15.0,
                                                      ),
                                                      ColorBalls(
                                                        color: Colors
                                                            .pink.shade300,
                                                        onSelected: () {
                                                          setState(() {
                                                            _aColor = Colors
                                                                .pink.shade300;
                                                            _bShadowColor =
                                                                Colors.pink
                                                                    .shade50;
                                                          });
                                                        },
                                                      ),
                                                      SizedBox(
                                                        width: 15.0,
                                                      ),
                                                      ColorBalls(
                                                        color: Colors
                                                            .orange.shade200,
                                                        onSelected: () {
                                                          setState(() {
                                                            _aColor = Colors
                                                                .orange
                                                                .shade200;
                                                            _bShadowColor =
                                                                Colors.orange
                                                                    .shade50;
                                                          });
                                                        },
                                                      ),
                                                      SizedBox(
                                                        width: 15.0,
                                                      ),
                                                      GestureDetector(
                                                        onTap: () {},
                                                        child: Container(
                                                          height: 36,
                                                          width: 36.0,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            borderRadius:
                                                                BorderRadius
                                                                    .all(
                                                              Radius.circular(
                                                                  18.0),
                                                            ),
                                                          ),
                                                          child: Image.asset(
                                                              'images/plus_icon.png'),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      Align(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Scenes',
                                          style: kBoldTextStyle.copyWith(
                                              color: Colors.black,
                                              fontSize: 18.0),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15.0,
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Row(
                                            children: <Widget>[
                                              Expanded(
                                                child: ScenesCard(
                                                  title: 'Birthday',
                                                  startColor: Colors
                                                      .deepOrange.shade300,
                                                  endColor: Colors
                                                      .deepOrange.shade200,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 25.0,
                                              ),
                                              Expanded(
                                                child: Container(
                                                  child: ScenesCard(
                                                    title: 'Party',
                                                    startColor:
                                                        Colors.purple.shade300,
                                                    endColor:
                                                        Colors.purple.shade200,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15.0,
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Row(
                                            children: <Widget>[
                                              Expanded(
                                                child: ScenesCard(
                                                  title: 'Relax',
                                                  startColor:
                                                      Colors.lightBlue.shade300,
                                                  endColor:
                                                      Colors.lightBlue.shade200,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 25.0,
                                              ),
                                              Expanded(
                                                child: Container(
                                                  child: ScenesCard(
                                                    title: 'Fun',
                                                    startColor:
                                                        Colors.green.shade300,
                                                    endColor:
                                                        Colors.green.shade200,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
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
