import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String iconName;
  final TextEditingController controller;
  final TextInputType inputType;
  final TextInputAction inputAction;
  final Function onSubmitted;
  final FocusNode focusNode;
  final String hintText;
  final bool isSecureEntry;

  CustomTextField(
      {this.iconName,
      this.controller,
      this.inputType,
      this.inputAction,
      this.onSubmitted,
      this.focusNode,
      this.hintText,
      this.isSecureEntry});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          flex: 1,
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Image.asset(
              iconName,
            ),
          ),
        ),
        Expanded(
          flex: 7,
          child: Align(
            alignment: Alignment.bottomCenter,
            child: TextField(
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              decoration: InputDecoration(
                hintText: hintText,
              ),
              controller: controller,
              focusNode: focusNode,
              keyboardType: inputType,
              textInputAction: inputAction,
              onSubmitted: onSubmitted,
              obscureText: isSecureEntry,
            ),
          ),
        )
      ],
    );
  }
}
