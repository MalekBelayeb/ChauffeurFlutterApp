
import 'package:flutter/material.dart';

class CustomPageRoute extends PageRouteBuilder
{
  final Widget secondPage;
  CustomPageRoute(this.secondPage) : super(transitionDuration: Duration(milliseconds: 250), pageBuilder: (context,animation,secondaryAnimation)=>secondPage);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation, Widget child) {
    // TODO: implement buildTransitions
    return SlideTransition(position: Tween<Offset>(
      begin: Offset(1,0)
          ,end: Offset.zero
    ).animate(animation),child: secondPage);
  }
}