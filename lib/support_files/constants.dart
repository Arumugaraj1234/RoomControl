import 'package:flutter/material.dart';

const kBgScreenDecoration = BoxDecoration(
  gradient: LinearGradient(
      colors: [
        const Color(0xFF08212A),
        const Color(0xFF0C3343),
      ],
      begin: const FractionalOffset(0.5, 0.0),
      end: const FractionalOffset(0.5, 1.0),
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp),
  image: DecorationImage(
      image: AssetImage('images/login_bg.png'),
      fit: BoxFit.none,
      alignment: Alignment.topRight),
);

const kBgView = BoxDecoration(
  gradient: LinearGradient(
      colors: [
        const Color(0xFF08212A),
        const Color(0xFF0C3343),
      ],
      begin: const FractionalOffset(0.5, 0.0),
      end: const FractionalOffset(0.5, 1.0),
      stops: [0.0, 1.0],
      tileMode: TileMode.clamp),
);

const kBoldTextStyle =
    TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 22.0);

const kLightTextStyle =
    TextStyle(color: Colors.white, fontWeight: FontWeight.w300, fontSize: 20.0);
