import 'package:flutter/material.dart';
import 'package:roomcontrol/custom_widgets/custom_shadowed_button.dart';
import 'package:roomcontrol/custom_widgets/custom_textfield.dart';
import 'package:roomcontrol/screens/splash_screen.dart';
import 'package:roomcontrol/support_files/auth_services.dart';
import 'package:roomcontrol/support_files/constants.dart';
import 'package:email_validator/email_validator.dart';
import 'package:fluttertoast/fluttertoast.dart';

class SignUpScreen extends StatefulWidget {
  static const String id = 'signup_screen';
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  FocusNode _userNameFocusNode = FocusNode();
  FocusNode _passwordFocusNode = FocusNode();
  FocusNode _emailFocusNode = FocusNode();
  TextEditingController _userNameController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  bool _isTermsAndConditionsSelected = false;

  void _onSignUpPressed() {
    String userName = _userNameController.text;
    String password = _passwordController.text;
    String email = _emailController.text;
    String errorMessage = '';
    if (userName == '') {
      errorMessage = "User name can't be empty";
    } else if (password.length < 6) {
      errorMessage = "Password length should be minimum 6 letters";
    } else if (EmailValidator.validate(email) == false) {
      errorMessage = "Invalid email";
    } else if (_isTermsAndConditionsSelected == false) {
      errorMessage = "Please select Terms & Conditions";
    }

    if (errorMessage == '') {
      AuthService.shared.userName = userName;
      AuthService.shared.password = password;
      AuthService.shared.email = email;
      Navigator.pushNamed(context, SplashScreen.id);
    } else {
      AuthService.shared.showToastMessage(
          message: errorMessage,
          place: ToastGravity.CENTER,
          duration: Toast.LENGTH_LONG);
    }
  }

  @override
  void dispose() {
    super.dispose();
    _userNameController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: kBgScreenDecoration.copyWith(
          image: DecorationImage(
              image: AssetImage('images/signup_bg.png'),
              fit: BoxFit.none,
              alignment: Alignment.topRight),
        ),
        child: SafeArea(
          child: Container(
            child: Column(
              children: <Widget>[
                Expanded(
                  flex: 3,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: GestureDetector(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Row(
                                  children: <Widget>[
                                    Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.white,
                                    ),
                                    Text(
                                      ' Back',
                                      style: kBoldTextStyle.copyWith(
                                          fontSize: 20.0),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Hero(
                            tag: 'title',
                            child: Material(
                              type: MaterialType.transparency,
                              child: Container(
                                child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Text(
                                    'Create New Account',
                                    style: kLightTextStyle.copyWith(
                                        color: Colors.teal.shade100),
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
                Expanded(
                  flex: 7,
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
                          color: Colors.white,
                        ),
                        child: Column(
                          children: <Widget>[
                            Expanded(
                              flex: 3,
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Container(
                                  child: Column(
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
                                          inputAction: TextInputAction.next,
                                          hintText: 'Password',
                                          onSubmitted: (newValue) {
                                            FocusScope.of(context)
                                                .requestFocus(_emailFocusNode);
                                          },
                                          isSecureEntry: false,
                                        ),
                                      ),
                                      Expanded(
                                        child: CustomTextField(
                                          iconName: 'images/mail_icon.png',
                                          controller: _emailController,
                                          focusNode: _emailFocusNode,
                                          inputType: TextInputType.emailAddress,
                                          inputAction: TextInputAction.done,
                                          hintText: 'Email',
                                          isSecureEntry: false,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Container(
                                  child: Column(
                                    children: <Widget>[
                                      Expanded(
                                        child: TermsConditionsButton(
                                          onTapped: () {
                                            setState(() {
                                              _isTermsAndConditionsSelected =
                                                  !_isTermsAndConditionsSelected;
                                            });
                                          },
                                          isSelected:
                                              _isTermsAndConditionsSelected,
                                        ),
                                      ),
                                      Expanded(
                                          child: Center(
                                        child: CustomShadowedButton(
                                          buttonTitle: 'SIGN UP',
                                          onTapped: () {
                                            _onSignUpPressed();
                                          },
                                        ),
                                      ))
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
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

class TermsConditionsButton extends StatelessWidget {
  final Function onTapped;
  final bool isSelected;

  TermsConditionsButton({this.onTapped, this.isSelected});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          height: 20.0,
          width: 20.0,
          decoration: BoxDecoration(
            color: isSelected ? Colors.teal : Colors.grey.shade300,
            borderRadius: BorderRadius.all(
              Radius.circular(4.0),
            ),
          ),
        ),
        SizedBox(
          width: 10.0,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: GestureDetector(
            onTap: onTapped,
            child: Row(
              children: <Widget>[
                Text(
                  'I have accepted the ',
                  style: TextStyle(color: Colors.grey.shade500),
                ),
                Text(
                  'Terms & Conditions',
                  style: TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    decoration: TextDecoration.underline,
                    decorationColor: Colors.teal,
                    decorationThickness: 2.0,
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
