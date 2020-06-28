import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roomcontrol/custom_widgets/custom_shadowed_button.dart';
import 'package:roomcontrol/custom_widgets/custom_textfield.dart';
import 'package:roomcontrol/screens/home_screen.dart';
import 'package:roomcontrol/screens/signup_screen.dart';
import 'package:roomcontrol/support_files/constants.dart';
import 'package:roomcontrol/support_files/auth_services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class LoginScreen extends StatefulWidget {
  static const String id = 'login_screen';
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  FocusNode _userNameFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    AuthService.shared.userName = '';
    AuthService.shared.password = '';
    AuthService.shared.email = '';
  }

  void onSignInTapped() {
    String userName = _userNameController.text;
    String password = _passwordController.text;
    String errorMessage = '';

    if (userName == '') {
      errorMessage = "User name can't be empty";
    } else if (password.length < 6) {
      errorMessage = 'Invalid password';
    }

    if (errorMessage == '') {
      if (userName == AuthService.shared.userName &&
          password == AuthService.shared.password) {
        Navigator.pushNamed(context, HomeScreen.id);
      } else {
        AuthService.shared.showToastMessage(
            message: 'Please sign up before to login',
            place: ToastGravity.CENTER,
            duration: Toast.LENGTH_LONG);
      }
    } else {
      AuthService.shared.showToastMessage(
          message: errorMessage,
          place: ToastGravity.CENTER,
          duration: Toast.LENGTH_LONG);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: kBgScreenDecoration.copyWith(
          image: DecorationImage(
              image: AssetImage('images/login_bg.png'),
              fit: BoxFit.none,
              alignment: Alignment.topRight),
        ),
        child: SafeArea(
            child: Container(
          child: Column(
            children: <Widget>[
              Expanded(
                flex: MediaQuery.of(context).viewInsets.bottom == 0 ? 3 : 0,
                child: Container(),
              ),
              Expanded(
                  flex: 7,
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 2,
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                horizontal: 25.0, vertical: 5.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Container(
                                      height: 3.0,
                                      color: Colors.white,
                                      width: MediaQuery.of(context).size.width *
                                          0.1,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Welcome',
                                      style: kBoldTextStyle,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'to Room Control',
                                      style: kLightTextStyle.copyWith(
                                          color: Colors.teal.shade100),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Expanded(
                          flex: 6,
                          child: Hero(
                            tag: 'form',
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
                                child: Padding(
                                  padding: const EdgeInsets.all(25.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      Expanded(
                                        child: CustomTextField(
                                          iconName: 'images/user_icon.png',
                                          controller: _userNameController,
                                          focusNode: _userNameFocusNode,
                                          inputType: TextInputType.text,
                                          inputAction: TextInputAction.next,
                                          hintText: 'Username',
                                          onSubmitted: (newValue) {
                                            FocusScope.of(context).requestFocus(
                                                _passwordFocusNode);
                                          },
                                          isSecureEntry: false,
                                        ),
                                      ),
                                      Expanded(
                                        child: CustomTextField(
                                          iconName: 'images/lock_icon.png',
                                          controller: _passwordController,
                                          focusNode: _passwordFocusNode,
                                          inputType: TextInputType.text,
                                          inputAction: TextInputAction.done,
                                          hintText: 'Password',
                                          onSubmitted: (newValue) {
                                            print(newValue);
                                          },
                                          isSecureEntry: true,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 35.0,
                                      ),
                                      CustomShadowedButton(
                                        buttonTitle: 'SIGN IN',
                                        onTapped: () {
                                          onSignInTapped();
                                        },
                                      ),
                                      SizedBox(
                                        height: 20.0,
                                      ),
                                      Visibility(
                                        visible: MediaQuery.of(context)
                                                    .viewInsets
                                                    .bottom ==
                                                0
                                            ? true
                                            : false,
                                        child: Expanded(
                                            child: GestureDetector(
                                          onTap: () {
                                            Navigator.pushNamed(
                                                context, SignUpScreen.id);
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                "Don't have an account?",
                                                style: TextStyle(
                                                    color: Colors.grey),
                                              ),
                                              Text(
                                                '   SIGNUP',
                                                style: TextStyle(
                                                    color: Colors.teal,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              )
                                            ],
                                          ),
                                        )),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
              Container(
                height: MediaQuery.of(context).viewInsets.bottom,
              )
            ],
          ),
        )),
      ),
    );
  }
}
