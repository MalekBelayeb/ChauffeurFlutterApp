import 'package:chauffeur_app/controller/MissionController.dart';
import 'package:chauffeur_app/entity/Mission.dart';
import 'package:chauffeur_app/utils/CustomPageRoute.dart';
import 'package:chauffeur_app/utils/StafimColors.dart';
import 'package:chauffeur_app/view/cells/MissionCell.dart';
import 'package:chauffeur_app/view/screens/LoginScreen.dart';
import 'package:chauffeur_app/view/screens/MissionDetailScreen.dart';
import 'package:flutter/material.dart';


class MesAffectationsTabScreen extends StatefulWidget
{

  @override
  State<MesAffectationsTabScreen> createState() => _MesAffectationsTabScreenState();
}

class _MesAffectationsTabScreenState extends State<MesAffectationsTabScreen> {
  var items = [
    DropdownMenuItem(
      value: 1,
      child: Text("Traités")
  ), DropdownMenuItem(
      value: 2,
      child: Text("Non traités")
  )];

  var listMissions = MissionController.instance.getMissionList();

  int dropdownvalue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration:StafimColors.BACKGROUND_COLOR,
        child: Padding(
          padding: EdgeInsets.only(top: 20,left: 5),

          child: Column(

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Mes Missions",style: TextStyle(
                    fontFamily: "peugeot-bold",
                    fontSize: 18,
                    color: Colors.black,
                  )),
                  DropdownButton(
                      value: dropdownvalue,
                      onChanged: (int? newValue) {
                        setState(() {

                          this.dropdownvalue = newValue!;

                        });
                      },
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: items)
                ],),
              Expanded(child:

              ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                padding: EdgeInsets.all(8),
                itemCount: this.listMissions.length,
                itemBuilder: (BuildContext context,int index) {
                  Mission mission = this.listMissions.elementAt(index);
                  return GestureDetector(
                    onTap: ()=>{

                      Navigator.push(context, CustomPageRoute(MissionDetailScreen(mission)))

                    },
                    child: MissionCell(mission),
                  );
                },
              ))



            ],

          ),
        ),
      )
    );
  }
}
