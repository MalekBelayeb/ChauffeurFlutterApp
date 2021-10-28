


import 'dart:convert';

import 'package:chauffeur_app/entity/Etat.dart';
import 'package:chauffeur_app/entity/Vehicule.dart';
import 'package:chauffeur_app/utils/DateManager.dart';

class Mission
{


  DateTime date;
  String id;
  Etat? etat;
  Vehicule vehicule;

  Mission(this.id,this.vehicule,this.etat,this.date);

 factory Mission.fromJson(Map<String, dynamic> json)
  {
    print(json);
    return Mission(
        json['_id'] as String ,
        Vehicule.fromJson(json['voiture']),
        json['etat'] == '' ? null: Etat.fromJson(json),
            DateManager.HandleMissionDate(json['date']));
  }

}