import 'dart:async';

import 'package:chauffeur_app/controller/LoginController.dart';
import 'package:chauffeur_app/utils/StafimColors.dart';
import 'package:chauffeur_app/view/screens/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';



class SignUpScreen extends StatefulWidget
{
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {

  final RoundedLoadingButtonController _btnControllerInfo = RoundedLoadingButtonController();

  String prenom="",nom="",cin="",confirmMdp="",mdp="";

  final formGlobalKey = GlobalKey < FormState > ();

  showSignUpResult(String message)
  {


    showDialog(
      context: context,
      builder: (context) {
        return  AlertDialog(
          title: new Text(message),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: new Text('Réessayer'),
            )
          ],
        );
      },
    );
  }

  void didTapped() async {

    int statusLogin = await LoginController.instance.SignUpChauffeur(cin, nom, prenom, this.mdp);

    if(statusLogin == 200)
      {
        Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoginScreen()), (Route<dynamic> route) => false);
      }else if(statusLogin == 401)
      {
        showSignUpResult("CIN existe deja");
      }
    _btnControllerInfo.reset();

  }

  @override
  Widget build(BuildContext context) {

    return  Scaffold(
        body:  SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(top:40,right:10,left:10,bottom:10),
            child: Card(

              child:  Padding(
                padding: EdgeInsets.only(top: 5,bottom: 20),
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10,top: 5,bottom: 5),
                      child: Text("S'inscrire:",style: TextStyle(
                        fontFamily: "peugeot-bold",
                        fontSize: 18,
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
                                      key: formGlobalKey,

                                      child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [

                                          Padding(
                                            padding: const EdgeInsets.only(top:10.0,right:8.0,left:8.0,bottom:8.0),
                                            child: Column(

                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [

                                                Text("CIN:",style: TextStyle(
                                                  fontFamily: "peugeot-bold",
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                )),
                                                Container(
                                                  decoration: new BoxDecoration(
                                                    border: new Border(
                                                      bottom: new BorderSide(
                                                        width: 0.5,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  child: new TextFormField(
                                                    obscureText: false,

                                                    style: const TextStyle(
                                                      fontFamily: "peugeot-regular",
                                                      color: Colors.black,
                                                    ),
                                                    decoration: new InputDecoration(

                                                      border: InputBorder.none,
                                                      hintText: 'Votre cin',
                                                      hintStyle: const TextStyle(fontFamily: "peugeot-regular",color: Colors.black26, fontSize: 12.0),
                                                      contentPadding: const EdgeInsets.only(
                                                          top: 5.0, right: 20.0, bottom:10.0, left: 5.0),
                                                    ),
                                                    validator: (value) {


                                                      if(value == null) {
                                                        return null;
                                                      }
                                                      if (value.isEmpty)
                                                        {
                                                          return "Champs CIN est manquant";
                                                        }else{
                                                        final n = num.tryParse(value);
                                                        if(n == null) {
                                                          return "CIN n'est pas valide";
                                                        }else{
                                                          return null;

                                                        }
                                                      }

                                                    },
                                                    onChanged: (value){

                                                      setState(() {
                                                        this.cin = value;
                                                      });

                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top:10.0,right:8.0,left:8.0,bottom:8.0),
                                            child: Column(

                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [

                                                Text("Prenom:",style: TextStyle(
                                                  fontFamily: "peugeot-bold",
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                )),
                                                Container(
                                                  decoration: new BoxDecoration(
                                                    border: new Border(
                                                      bottom: new BorderSide(
                                                        width: 0.5,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  child: new TextFormField(
                                                    obscureText: false,

                                                    style: const TextStyle(
                                                      fontFamily: "peugeot-regular",
                                                      color: Colors.black,
                                                    ),
                                                    decoration: new InputDecoration(

                                                      border: InputBorder.none,
                                                      hintText: 'Entrer votre prenom',
                                                      hintStyle: const TextStyle(fontFamily: "peugeot-regular",color: Colors.black26, fontSize: 12.0),
                                                      contentPadding: const EdgeInsets.only(
                                                          top: 5.0, right: 20.0, bottom:10.0, left: 5.0),
                                                    ),
                                                    validator: (value) {
                                                      if(value != null)
                                                      {

                                                        if(value.isEmpty )
                                                        {
                                                          return "Champs prenom est manquant";
                                                        }else{
                                                          return null;
                                                        }
                                                      }else{
                                                        return "Champs prenom est manquant";

                                                      }
                                                    },
                                                    onChanged: (String value){
                                                      setState(() {
                                                        this.prenom = value;
                                                      });
                                                    },
                                                  ),
                                                ),


                                              ],
                                            ),
                                          ),

                                          Padding(
                                            padding: const EdgeInsets.only(top:10.0,right:8.0,left:8.0,bottom:15),
                                            child: Column(

                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [

                                                Text("Nom:",style: TextStyle(
                                                  fontFamily: "peugeot-bold",
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                )),
                                                Container(
                                                  decoration: new BoxDecoration(
                                                    border: new Border(
                                                      bottom: new BorderSide(
                                                        width: 0.5,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  child: new TextFormField(
                                                    obscureText: false,

                                                    style: const TextStyle(
                                                      fontFamily: "peugeot-regular",
                                                      color: Colors.black,
                                                    ),
                                                    decoration: new InputDecoration(

                                                      border: InputBorder.none,
                                                      hintText: 'Entrer votre nom',
                                                      hintStyle: const TextStyle(fontFamily: "peugeot-regular",color: Colors.black26, fontSize: 12.0),
                                                      contentPadding: const EdgeInsets.only(
                                                          top: 5.0, right: 20.0, bottom:10.0, left: 5.0),
                                                    ),
                                                    validator: (value) {
                                                      if(value != null)
                                                        {

                                                          if(value.isEmpty )
                                                          {
                                                            return "Champs nom est manquant";
                                                          }else{
                                                            return null;
                                                          }
                                                        }else{
                                                        return "Champs nom est manquant";

                                                      }

                                                      },
                                                    onChanged: (value){
                                                      setState(() {
                                                        this.nom = value;
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top:10.0,right:8.0,left:8.0,bottom:15),
                                            child: Column(

                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [

                                                Text("Votre mot de passe:",style: TextStyle(
                                                  fontFamily: "peugeot-bold",
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                )),
                                                Container(
                                                  decoration: new BoxDecoration(
                                                    border: new Border(
                                                      bottom: new BorderSide(
                                                        width: 0.5,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  child: new TextFormField(
                                                    obscureText: true,

                                                    style: const TextStyle(
                                                      fontFamily: "peugeot-regular",
                                                      color: Colors.black,
                                                    ),
                                                    decoration: new InputDecoration(

                                                      border: InputBorder.none,
                                                      hintText: 'Entrer votre mot de passe',
                                                      hintStyle: const TextStyle(fontFamily: "peugeot-regular",color: Colors.black26, fontSize: 12.0),
                                                      contentPadding: const EdgeInsets.only(
                                                          top: 5.0, right: 20.0, bottom:10.0, left: 5.0),
                                                    ),
                                                    validator: (value) {
                                                      if(value != null)
                                                      {

                                                        if(value.isEmpty )
                                                        {
                                                          return "Champs mdp est manquant";
                                                        }else{
                                                          return null;
                                                        }
                                                      }else{
                                                        return "Champs mdp est manquant";

                                                      }

                                                    },
                                                    onChanged: (value){
                                                      setState(() {
                                                        this.mdp = value;
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.only(top:10.0,right:8.0,left:8.0,bottom:15),
                                            child: Column(

                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [

                                                Text("Confirmer votre mdp:",style: TextStyle(
                                                  fontFamily: "peugeot-bold",
                                                  fontSize: 14,
                                                  color: Colors.black,
                                                )),
                                                Container(
                                                  decoration: new BoxDecoration(
                                                    border: new Border(
                                                      bottom: new BorderSide(
                                                        width: 0.5,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                  child: new TextFormField(
                                                    obscureText: true,

                                                    style: const TextStyle(
                                                      fontFamily: "peugeot-regular",
                                                      color: Colors.black,
                                                    ),
                                                    decoration: new InputDecoration(

                                                      border: InputBorder.none,
                                                      hintText: 'Confirmer votre mdp',
                                                      hintStyle: const TextStyle(fontFamily: "peugeot-regular",color: Colors.black26, fontSize: 12.0),
                                                      contentPadding: const EdgeInsets.only(
                                                          top: 5.0, right: 20.0, bottom:10.0, left: 5.0),
                                                    ),
                                                    validator: (value) {
                                                      if(value != null)
                                                      {

                                                        if(value.isEmpty )
                                                        {
                                                          return "Champs est manquant";
                                                        }else{

                                                          if(this.mdp!=value)
                                                            {

                                                              return "Champs mot de passe n'est pas identique";

                                                            }else{

                                                            return null;

                                                          }
                                                        }
                                                      }else{
                                                        return "Champs est manquant";

                                                      }

                                                    },
                                                    onChanged: (value){
                                                      setState(() {
                                                        this.confirmMdp = value;
                                                      });
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ))],
                              ),
                            ),

                            Container(

                              width: 100.0,
                              height: 40.0,
                              child: RoundedLoadingButton(

                                child: Text('Confirmer', style: TextStyle(fontFamily: "peugeot-regular",fontSize: 12,color: Colors.white)),
                                controller: _btnControllerInfo,
                                onPressed:(){
                                  if (formGlobalKey.currentState!.validate()) {
                                    formGlobalKey.currentState!.save();
                                    this.didTapped();
                                  }else{
                                    this._btnControllerInfo.reset();
                                  }
                                },
                              ),
                            )


                          ],
                        )],
                    )


                  ],


                ),

              ),
            ),
          ),
        )
    );
  }
}