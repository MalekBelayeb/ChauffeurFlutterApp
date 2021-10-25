


import 'dart:convert';

import 'package:chauffeur_app/entity/Etat.dart';
import 'package:chauffeur_app/entity/Vehicule.dart';

class Mission
{


  DateTime date;
  String id;
  Etat? etat;
  Vehicule vehicule;

  Mission(this.id,this.vehicule,this.etat,this.date);

 factory Mission.fromJson(Map<String, dynamic> json)
  {
    return Mission(
        json['_id'] as String ,
        Vehicule.fromJson(json['voiture']),
            Etat.fromJson(json),
            DateTime.now().toUtc());
  }

}