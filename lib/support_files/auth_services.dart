import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutter/material.dart';
import 'package:roomcontrol/models/light_model.dart';

class AuthService {
  static final AuthService shared = AuthService();

  void showToastMessage({String message, ToastGravity place, Toast duration}) {
    Fluttertoast.showToast(
        msg: message,
        gravity: place,
        toastLength: duration,
        backgroundColor: Colors.red);
  }

  String userName = '';
  String password = '';
  String email = '';

  List<LightModel> lights = [
    LightModel(
        iconName: 'images/teal_bulb.png',
        title: 'Main Light',
        bgColor: Colors.white,
        textColor: Colors.teal),
    LightModel(
        iconName: 'images/furniture.png',
        title: 'Desk Lights',
        bgColor: Colors.teal,
        textColor: Colors.white),
    LightModel(
        iconName: 'images/teal_bed.png',
        title: 'Bedroom',
        bgColor: Colors.white,
        textColor: Colors.teal),
  ];
}
