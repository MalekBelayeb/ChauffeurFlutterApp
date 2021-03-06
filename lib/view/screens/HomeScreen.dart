import 'package:chauffeur_app/entity/User.dart';
import 'package:chauffeur_app/utils/CustomPageRoute.dart';
import 'package:chauffeur_app/utils/StafimColors.dart';
import 'package:chauffeur_app/view/screens/HomeTabChild/CalendrierTabScreen.dart';
import 'package:chauffeur_app/view/screens/HomeTabChild/MesMissionsTabScreen.dart';
import 'package:chauffeur_app/view/screens/LoginScreen.dart';
import 'package:chauffeur_app/view/screens/SettingsScreen.dart';
import 'package:flutter/material.dart';


class HomeScreen extends StatelessWidget
{
  User? user;

  HomeScreen(this.user);

  leavingDialog(BuildContext context)
  {
    showDialog(
      context: context,
      builder: (context) {
        return new AlertDialog(
          title: new Text('êtes vous sûr de vouloir quitter ?'),
          actions: <Widget>[
            new TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: new Text('Non'),
            ),
            new TextButton(
              onPressed: () =>
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginScreen())),
              child: new Text('Oui'),
            ),
          ],
        );
      },
    );
  }

  final List<Tab> myTabs = <Tab>[
    Tab(text: 'Mes Missions'),
    Tab(text: 'Calendrier'),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: myTabs.length,

      child: Scaffold(
        appBar: AppBar(

          title:this.user == null ? Text("") : Text(this.user!.prenom.toString() + " "+ this.user!.nom.toString(),style:  TextStyle(
            fontFamily: "peugeot-bold",
            fontSize: 16,
            color: Colors.white,
          ),),

          actions: [Padding(
              padding: EdgeInsets.only(right: 15.0),
              child: Row(

                children: [
                  Padding(

                    padding: EdgeInsets.only(right: 15),
                    child: GestureDetector(
                    onTap: () {
                      if(this.user != null)
                        {
                          Navigator.push(context, CustomPageRoute(SettingsScreen(this.user!)));

                        }

                    },
                    child: Icon(
                      Icons.settings ,
                      size: 26.0,
                    ),
                  )),

                  GestureDetector(
                    onTap: () {
                      leavingDialog(context);
                    },
                    child: Icon(
                      Icons.exit_to_app_outlined ,
                      size: 26.0,
                    ),
                  )
                ],
              )
          ),],

          flexibleSpace: Container(
            decoration: StafimColors.APP_BAR_COLOR
          ),
          bottom: TabBar(indicatorColor: Colors.white,tabs: myTabs),
        ),
      body: TabBarView(children: [MesAffectationsTabScreen(this.user!),CalendrierTabScreen(this.user!)],),
      ),
    );

  }

}

