import 'package:chauffeur_app/utils/StafimColors.dart';
import 'package:flutter/material.dart';

class SignInButton extends StatelessWidget {
  SignInButton();
  @override
  Widget build(BuildContext context) {
    return (new Container(
      width: 120.0,
      height: 60.0,
      alignment: FractionalOffset.center,
      decoration: new BoxDecoration(
        color: StafimColors.BLUE_COLOR,
        borderRadius: BorderRadius.all(const Radius.circular(5)),
      ),
      child: new Text(
        "Sign In",
        style: new TextStyle(
          fontFamily: "peugeot-bold",
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
    ));
  }
}