import 'package:flutter/material.dart';
import 'package:roomcontrol/support_files/constants.dart';

class SplashScreen extends StatefulWidget {
  static const String id = 'splash_screen';
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation _animation;
  int _flag = 1;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    _animation = CurvedAnimation(parent: _controller, curve: Curves.decelerate);
    _controller.forward();
    _animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _flag++;
        if (_flag <= 4) {
          _controller.reverse();
        } else {
          Navigator.popUntil(context, (route) => route.isFirst);
        }
      } else if (status == AnimationStatus.dismissed) {
        _flag++;
        _controller.forward();
      }
    });

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: kBgScreenDecoration.copyWith(
          image: DecorationImage(
              image: AssetImage('images/login_bg.png'),
              fit: BoxFit.none,
              alignment: Alignment.topRight),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 6,
              child: Container(),
            ),
            Container(
              height: 100,
              width: double.infinity,
              child: Center(
                  child: RotationTransition(
                turns: Tween(begin: 0.0, end: 0.25).animate(_controller),
                child: Container(
                  height: 25.0 + (25.0 * _controller.value),
                  width: 25.0 + (25.0 * _controller.value),
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('images/spinner_icon.png'),
                        fit: BoxFit.fill,
                        alignment: Alignment.topRight),
                  ),
                ),
              )),
            ),
            Expanded(
              child: Hero(
                tag: 'title',
                child: Material(
                  type: MaterialType.transparency,
                  child: Container(
                    child: Text(
                      "Let's get you started",
                      style: kLightTextStyle.copyWith(
                          color: Colors.teal.shade50, fontSize: 25.0),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              child: Container(),
            ),
          ],
        ),
      ),
    );
  }
}

//Hero(
//tag: 'form',
//child: Material(
//type: MaterialType.transparency,
//child: Container(
//color: Colors.white,
//height: 0.0,
//),
//),
//)
