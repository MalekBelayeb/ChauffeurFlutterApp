import 'package:chauffeur_app/utils/StafimColors.dart';
import 'package:flutter/material.dart';

class AjouterEtatButton extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return (new Container(
      width: 100.0,
      height: 40.0,
      alignment: FractionalOffset.center,
      decoration: new BoxDecoration(
        color: StafimColors.BLUE_COLOR,
        borderRadius: BorderRadius.all(const Radius.circular(10)),
      ),
      child: new Text(
        "Confirmer",
        style: new TextStyle(
          fontFamily: "peugeot-bold",
          color: Colors.white,
          fontSize: 14.0,
        ),
      ),
    ));
  }
}