
import 'package:chauffeur_app/entity/Mission.dart';
import 'package:chauffeur_app/entity/TraitementEnum.dart';
import 'package:chauffeur_app/utils/DateManager.dart';
import 'package:chauffeur_app/utils/StafimColors.dart';
import 'package:flutter/material.dart';

class MissionCell extends StatelessWidget
{
  Mission mission;

  MissionCell(this.mission);

  List<Color> getColors()
  {
    if(this.mission.etat == null)
      {

        return [Color.fromRGBO(245,245,245, 1),Color.fromRGBO(220,220,220, 1)];

      }else{

        if(this.mission.etat!.etat == Traitement.VOITURE_MORTE || this.mission.etat!.etat == Traitement.MAUVAIS_ETAT)
          {
            return [Color.fromRGBO(245,245,245, 1),Color.fromRGBO(190,0,0, 1)];

          }else if(this.mission.etat!.etat == Traitement.CONDITION_MEDIOCRE || this.mission.etat!.etat == Traitement.MAL_ENTRETENU|| this.mission.etat!.etat == Traitement.AUTRE )
            {

              return  [Color.fromRGBO(245,245,245, 1),Color.fromRGBO(191,191,0, 1)];

            }else if(this.mission.etat!.etat == Traitement.BON_ETAT){

          return  [Color.fromRGBO(245,245,245, 1),Color.fromRGBO(0,165,0, 1)];

        }else{

          return [Color.fromRGBO(245,245,245, 1),Color.fromRGBO(220,220,220, 1)];

        }
    }
  }



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
                  colors: getColors(),
                end: Alignment(0.5,1),
                begin:Alignment(0.55,0.1),
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
                        Text(DateManager.HandleMissionDate(this.mission.date), style: TextStyle(
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
                        Text(this.mission.vehicule.matricule, style: TextStyle(
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
                        Text(this.mission.vehicule.marque, style: TextStyle(
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
                        Text(this.mission.vehicule.modele, style: TextStyle(
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
                        Text(this.mission.vehicule.annee , style: TextStyle(
                          fontFamily: "peugeot-regular",
                          fontSize: 12,
                          color: Colors.black,
                        ), ),
                      ],
                    ),
                    Row(
                      children: [
                        Text("Etat: " ,style: TextStyle(
                          fontFamily: "peugeot-bold",
                          fontSize: 14,
                          color: Colors.black,
                        )),
                        Text(this.mission.etat == null ? "Non traité": TraitementEnum.enumToString(this.mission.etat!.etat) , style: TextStyle(
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
