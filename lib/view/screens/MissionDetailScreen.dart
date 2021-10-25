import 'dart:async';
import 'package:chauffeur_app/controller/MissionController.dart';
import 'package:chauffeur_app/entity/Etat.dart';
import 'package:chauffeur_app/entity/Mission.dart';
import 'package:chauffeur_app/entity/TraitementEnum.dart';
import 'package:chauffeur_app/utils/StafimColors.dart';
import 'package:chauffeur_app/view/cells/MissionCell.dart';
import 'package:flutter/material.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';


class MissionDetailScreen extends StatefulWidget
{
  Mission mission;
  MissionDetailScreen(this.mission);

  @override
  State<MissionDetailScreen> createState() => _MissionDetailScreenState();
}

class _MissionDetailScreenState extends State<MissionDetailScreen> {
  final RoundedLoadingButtonController _btnController = RoundedLoadingButtonController();

  var items = [
    DropdownMenuItem(
        value: 0,
        child: Text("En bon état")
    ), DropdownMenuItem(
        value: 1,
        child: Text("Mal entretenu")
    )
    , DropdownMenuItem(
        value: 2,
        child: Text("Condition médiocre")
    )
    , DropdownMenuItem(
        value: 3,
        child: Text("En mauvais état")
    )
    , DropdownMenuItem(
        value: 4,
        child: Text("Voiture morte")
    ), DropdownMenuItem(
        value: 5,
        child: Text("Autre")
    )
  ];

  int dropdownvalue = 0;

  @override
  void initState() {
    super.initState();
    if(this.widget.mission.etat != null)
      {
        dropdownvalue = Traitement.values.indexOf(this.widget.mission.etat!.etat);
      }

  }


  String note = "";

  void didTapped() async {

    Mission mission = this.widget.mission;
    Etat etat = Etat(Traitement.values[dropdownvalue], this.note);
    mission.etat= etat;

    MissionController.instance.updateMission(mission).then((value) => {

      if(value == true)
        {
        _btnController.success()
        }else{
        _btnController.error()
      }

    });


  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SingleChildScrollView( child: Container(
        decoration: StafimColors.BACKGROUND_COLOR_DETAIL,

        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(top:50),

          child: Column(

            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10,top: 5,bottom: 10),
                child: Text("Détails voiture:",style: TextStyle(
                  fontFamily: "peugeot-bold",
                  fontSize: 22,
                  color: Colors.black,
                )
                ),
              ),
              MissionCell(widget.mission),
              Card(

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  padding: EdgeInsets.only(top:15,left: 10,bottom: 15,right: 10),
                  margin: EdgeInsets.only(left: 10),
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.start,

                    children: [

                      Padding(
                        padding: EdgeInsets.only(top: 5,bottom: 10),
                        child: Text("Ajouter un état:",style: TextStyle(
                          fontFamily: "peugeot-bold",
                          fontSize: 22,
                          color: Colors.black,
                        )
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Etat: ",style: TextStyle(
                            fontFamily: "peugeot-bold",
                            fontSize: 18,
                            color: Colors.black,
                          )),
                          Padding(
                            padding: EdgeInsets.only(left: 20)
                            ,
                            child:DropdownButton(
                                value: dropdownvalue,
                                onChanged: (int? newValue) {
                                  setState(() {

                                    this.dropdownvalue = newValue!;

                                  });

                                },
                                icon: Icon(Icons.keyboard_arrow_down),
                                items: items)

                            ,)
                        ],),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Note: ",style: TextStyle(
                            fontFamily: "peugeot-bold",
                            fontSize: 18,
                            color: Colors.black,
                          )),

                        ],),

                      Container(

                        width: MediaQuery.of(context).size.width-50,
                        child:
                        TextFormField(
                          initialValue: this.widget.mission.etat == null ? "":(this.widget.mission.etat!.note == null || this.widget.mission.etat!.note.isEmpty) ? "" :this.widget.mission.etat!.note,
                          decoration: InputDecoration(hintText: 'Ajouter votre note si besoin...',hintStyle:  TextStyle(
                            fontFamily: "peugeot-italic",
                            fontSize: 12,
                            color: Colors.grey,
                          )),
                          keyboardType: TextInputType.multiline,
                          maxLines: 4,
                          maxLength: 200,
                          onChanged: (String val)
                          {
                            setState(() {
                              this.note = val;
                            });
                          },
                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10),child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          this.widget.mission.etat == null ? Text('Pas encore traité',style:  TextStyle(
                            fontFamily: "peugeot-regular",
                            fontSize: 14,
                            color: Colors.black,
                          ),):Container(),
                          Container(
                            width: 120.0,
                            height: 60.0,
                            child: RoundedLoadingButton(

                              child: Text('Confirmer', style: TextStyle(color: Colors.white)),
                              controller: _btnController,
                              onPressed: didTapped,
                            ),
                          )],
                      ),)
                    ],

                  ),
                ),
              )
            ],
          ),
        ),
      ),)
    );

  }
}