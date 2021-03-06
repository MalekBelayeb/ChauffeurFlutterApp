import 'dart:async';

import 'package:chauffeur_app/controller/LoginController.dart';
import 'package:chauffeur_app/entity/User.dart';
import 'package:chauffeur_app/view/screens/LoginScreen.dart';
import 'package:chauffeur_app/view/screens/SettingsChild/ChangePasswordChildScreen.dart';
import 'package:chauffeur_app/view/screens/SettingsChild/DisableAccountChildScreen.dart';

import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class SettingsScreen extends StatefulWidget
{
  User user;
  SettingsScreen(this.user);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();

}

class _SettingsScreenState extends State<SettingsScreen> {
  final RoundedLoadingButtonController _btnControllerInfo = RoundedLoadingButtonController();

  showSettingsUpdateInfoResult(String message)
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
    print("cin "+this.widget.user.cin);
  
    int result = await LoginController.instance.updateChauffeur(this.widget.user.id, this.nom, this.prenom);
    if(result == 200 )
      {
        showSettingsUpdateInfoResult("Votre operation s'est bien passé");
        this._btnControllerInfo.reset();

      }else{

      showSettingsUpdateInfoResult("Votre opération a été echoué");
      this._btnControllerInfo.error();
    }

  }

  String prenom="",nom="";

  @override
  void initState() {

    this.prenom = this.widget.user.prenom;
    this.nom = this.widget.user.nom;

    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(

      body: SingleChildScrollView(

        child: Column(
          children: [

        Container(
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
                  child: Text("Mes infos:",style: TextStyle(
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
                                  child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                    children: [

                                      Padding(
                                        padding: const EdgeInsets.only(top:15.0,right:8.0,left:8.0,bottom:8.0),
                                        child: Column(

                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [

                                            Text("Votre CIN:",style: TextStyle(
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
                                                initialValue: this.widget.user.cin,
                                                enabled: false,
                                                focusNode: FocusNode(),
                                                enableInteractiveSelection: false,
                                                style: const TextStyle(
                                                  fontFamily: "peugeot-regular",
                                                  color: Colors.black,
                                                ),
                                                decoration: new InputDecoration(

                                                  border: InputBorder.none,
                                                  hintText: 'Votre cin',
                                                  hintStyle: const TextStyle(fontFamily: "peugeot-regular",color: Colors.black26, fontSize: 12.0),
                                                  contentPadding: const EdgeInsets.only(
                                                      top: 10.0, right: 20.0, bottom:20.0, left: 5.0),
                                                ),
                                                onChanged: (value){

                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top:15.0,right:8.0,left:8.0,bottom:8.0),
                                        child: Column(

                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [

                                            Text("Votre prenom:",style: TextStyle(
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

                                                initialValue: this.widget.user.prenom,
                                                style: const TextStyle(
                                                  fontFamily: "peugeot-regular",
                                                  color: Colors.black,
                                                ),
                                                decoration: new InputDecoration(

                                                  border: InputBorder.none,
                                                  hintText: 'Entrer votre prenom',
                                                  hintStyle: const TextStyle(fontFamily: "peugeot-regular",color: Colors.black26, fontSize: 12.0),
                                                  contentPadding: const EdgeInsets.only(
                                                      top: 10.0, right: 20.0, bottom:20.0, left: 5.0),
                                                ),
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
                                        padding: const EdgeInsets.only(top:15.0,right:8.0,left:8.0,bottom:15),
                                        child: Column(

                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [

                                            Text("Votre nom:",style: TextStyle(
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
                                                initialValue: this.widget.user.nom,
                                                style: const TextStyle(
                                                  fontFamily: "peugeot-regular",
                                                  color: Colors.black,
                                                ),
                                                decoration: new InputDecoration(

                                                  border: InputBorder.none,
                                                  hintText: 'Entrer votre nom',
                                                  hintStyle: const TextStyle(fontFamily: "peugeot-regular",color: Colors.black26, fontSize: 12.0),
                                                  contentPadding: const EdgeInsets.only(
                                                      top: 15.0, right: 20.0, bottom:20.0, left: 5.0),
                                                ),
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
                            onPressed:didTapped,
                          ),
                        ) ],
                    )],
                )


              ],


            ),

          ),
        ),
      ),            //ChangePasswordChildScreen(),
            DisableAccoundChildScreen(this.widget.user)

          ],
        ),
      ),
    );
  }
}



