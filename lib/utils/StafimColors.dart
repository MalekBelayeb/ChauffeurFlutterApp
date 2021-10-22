import 'package:flutter/material.dart';

class StafimColors{

  static Color BLUE_COLOR = Color.fromRGBO(0, 163, 224, 1);
  static BoxDecoration BACKGROUND_COLOR = BoxDecoration(
    gradient: LinearGradient(
      colors: [Color.fromRGBO(220,220,220, 1),Color.fromRGBO(245,245,245, 1)],
      begin: Alignment(0.5,0.5),
      end:Alignment(0.5,1),
    ),
  );

  static BoxDecoration BACKGROUND_COLOR_DETAIL = BoxDecoration(
    gradient: LinearGradient(
      colors: [Color.fromRGBO(220,220,220, 1),Color.fromRGBO(245,245,245, 1)],
      begin: Alignment(0.5,1),
      end:Alignment(0.5,0.5),
    ),
  );

  static BoxDecoration BACKGROUND_COLOR_SIGNIN = BoxDecoration(
    gradient: LinearGradient(
      colors: [Color.fromRGBO(220,220,220, 1),Color.fromRGBO(245,245,245, 1)],
      begin: Alignment(0.5,1),
      end:Alignment(0.5,0.5),
    ),
  );


  static BoxDecoration APP_BAR_COLOR = BoxDecoration(
  gradient: LinearGradient(
  colors: [Colors.grey,Colors.black54],
  begin: Alignment.bottomRight,
  end:Alignment.centerLeft
  )
  );


}