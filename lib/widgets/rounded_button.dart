import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final Color color;
  final String displayText;
  final Function onPressed;

  RoundedButton({this.color, this.displayText, @required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        color: color,
        borderRadius: BorderRadius.circular(30.0),
        elevation: 5.0,
        child: MaterialButton(
          onPressed: onPressed,
          height: 42.0,
          child: Text(displayText),
          textColor: Colors.white,
        ),
      ),
    );
  }
}
