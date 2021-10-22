import 'package:chauffeur_app/entity/Mission.dart';
import 'package:chauffeur_app/utils/StafimColors.dart';
import 'package:chauffeur_app/view/cells/MissionCell.dart';
import 'package:chauffeur_app/view/widgets/AjouterEtatButton.dart';
import 'package:flutter/material.dart';


class MissionDetailScreen extends StatefulWidget
{
  Mission mission;
  MissionDetailScreen(this.mission);

  @override
  State<MissionDetailScreen> createState() => _MissionDetailScreenState();
}

class _MissionDetailScreenState extends State<MissionDetailScreen> {

  var items = [
    DropdownMenuItem(
        value: 1,
        child: Text("En bon état")
    ), DropdownMenuItem(
        value: 2,
        child: Text("Mal entretenu")
    )
    , DropdownMenuItem(
        value: 3,
        child: Text("Condition médiocre")
    )
    , DropdownMenuItem(
        value: 4,
        child: Text("En mauvais état")
    )
    , DropdownMenuItem(
        value: 5,
        child: Text("Voiture morte")
    ), DropdownMenuItem(
        value: 6,
        child: Text("Autre")
    )
  ];
  int dropdownvalue = 1;

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

                          decoration: InputDecoration(hintText: 'Ajouter votre note si besoin',hintStyle: TextStyle(fontSize: 12)),
                          keyboardType: TextInputType.multiline,
                          maxLines: 4,
                          maxLength: 200,

                        ),
                      ),
                      Padding(padding: EdgeInsets.only(top: 10),child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [AjouterEtatButton()],
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