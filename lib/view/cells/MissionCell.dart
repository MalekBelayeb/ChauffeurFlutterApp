
import 'package:chauffeur_app/entity/Mission.dart';
import 'package:chauffeur_app/utils/StafimColors.dart';
import 'package:flutter/material.dart';

class MissionCell extends StatelessWidget
{
  Mission mission;

  MissionCell(this.mission);

  @override
  Widget build(BuildContext context) {

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child:
      Container(
          decoration: BoxDecoration(
              borderRadius:  BorderRadius.circular(10),
              gradient: LinearGradient(
                  colors: [Colors.green,Colors.blueGrey],
                  begin: Alignment.bottomRight,
                  end:Alignment.centerLeft
              )
          ),
          child:Container(

            padding: EdgeInsets.only(top:10,left: 10,bottom: 10,right: 0),
            margin: EdgeInsets.only(left: 10),
            decoration: BoxDecoration(
                borderRadius:  BorderRadius.only(topRight: Radius.circular(10),bottomRight: Radius.circular(10)),
                color: Colors.white,

            ),
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Row(

                      children: [
                        Text("Date: " ,style: TextStyle(
                          fontFamily: "peugeot-bold",
                          fontSize: 14,
                          color: Colors.black,
                        )),
                        Text(this.mission.date.toString(), style: TextStyle(
                          fontFamily: "peugeot-regular",
                          fontSize: 12,
                          color: Colors.black,
                        ), ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Matricule: " ,style: TextStyle(
                          fontFamily: "peugeot-bold",
                          fontSize: 14,
                          color: Colors.black,
                        )),
                        Text(this.mission.matricule, style: TextStyle(
                          fontFamily: "peugeot-regular",
                          fontSize: 12,
                          color: Colors.black,
                        ), ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Marque: " ,style: TextStyle(
                          fontFamily: "peugeot-bold",
                          fontSize: 14,
                          color: Colors.black,
                        )),
                        Text(this.mission.marque, style: TextStyle(
                          fontFamily: "peugeot-regular",
                          fontSize: 12,
                          color: Colors.black,
                        ), ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Modéle: " ,style: TextStyle(
                          fontFamily: "peugeot-bold",
                          fontSize: 14,
                          color: Colors.black,
                        )),
                        Text(this.mission.modele, style: TextStyle(
                          fontFamily: "peugeot-regular",
                          fontSize: 12,
                          color: Colors.black,
                        ), ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Année: " ,style: TextStyle(
                          fontFamily: "peugeot-bold",
                          fontSize: 14,
                          color: Colors.black,
                        )),
                        Text(this.mission.annee, style: TextStyle(
                          fontFamily: "peugeot-regular",
                          fontSize: 12,
                          color: Colors.black,
                        ), ),
                      ],
                    ),

                  ],
                ),
                IconButton(iconSize: 36,onPressed: ()=>{}, icon: Icon(Icons.keyboard_arrow_right))
              ],
            )
          )
      ),);
  }



}
