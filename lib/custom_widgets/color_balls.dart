import 'package:flutter/material.dart';

class ColorBalls extends StatelessWidget {
  final Color color;
  final Function onSelected;

  ColorBalls({this.color, this.onSelected});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: Container(
        height: 36,
        width: 36.0,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(18.0),
          ),
        ),
      ),
    );
  }
}
