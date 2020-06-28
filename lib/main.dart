import 'package:flutter/material.dart';
import 'package:roomcontrol/screens/bedroom_screen.dart';
import 'package:roomcontrol/screens/home_screen.dart';
import 'package:roomcontrol/screens/login_screen.dart';
import 'package:roomcontrol/screens/signup_screen.dart';
import 'package:roomcontrol/screens/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Room Control',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: LoginScreen.id,
      routes: {
        LoginScreen.id: (context) => LoginScreen(),
        SignUpScreen.id: (context) => SignUpScreen(),
        SplashScreen.id: (context) => SplashScreen(),
        HomeScreen.id: (context) => HomeScreen(),
        BedRoomScreen.id: (context) => BedRoomScreen()
      },
    );
  }
}
