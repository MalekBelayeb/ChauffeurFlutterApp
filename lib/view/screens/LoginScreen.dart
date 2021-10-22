import 'package:chauffeur_app/utils/StafimColors.dart';
import 'package:chauffeur_app/view/screens/HomeScreen.dart';
import 'package:chauffeur_app/view/widgets/InputFieldArea.dart';
import 'package:chauffeur_app/view/widgets/SignInButton.dart';
import 'package:flutter/material.dart';
import 'package:flutter/animation.dart';

class LoginScreen extends StatefulWidget
{

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> with TickerProviderStateMixin {

  late AnimationController _loginButtonController;

  @override
  void initState() {
    super.initState();

    this._loginButtonController =AnimationController(duration: Duration(milliseconds: 3000),vsync: this);

  }
  @override
  void dispose() {
    // TODO: implement dispose
    _loginButtonController.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration:StafimColors.BACKGROUND_COLOR_SIGNIN,
        child:Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Card(

              child:  Padding(
                padding: EdgeInsets.only(top: 5,bottom: 20),
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10,top: 5,bottom: 5),
                      child: Text("Se connecter:",style: TextStyle(
                        fontFamily: "peugeot-bold",
                        fontSize: 22,
                        color: Colors.black,
                      )
                      ),
                    ),
                    Stack(
                      alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 20.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  Form(
                                      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          InputFieldArea(hint: "Username", obscure: false, icon: Icons.person_outline),
                                          InputFieldArea(hint: "Mot de passe", obscure: true, icon: Icons.lock_outline)],

                                      ))],
                              ),
                            ),

                            InkWell(onTap:() {

                              setState(() {

                                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => HomeScreen()),(route)=>false);

                              });

                            },child: Align(alignment: Alignment.centerRight, child:
                            Padding(padding: EdgeInsets.only(top: 50,right: 20),child: SignInButton()),)

                              ,)
                          ],
                        )],
                    )


                  ],


                ),

              ),
            ),


          ],),)
    );

  }
}
