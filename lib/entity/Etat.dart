
import 'package:chauffeur_app/entity/TraitementEnum.dart';

class Etat{

  Traitement etat;
  String note;
  Etat(this.etat,this.note);

  factory Etat.fromJson(Map<String, dynamic> json)
  {

    return Etat(
        Traitement.values.firstWhere((element) => element.toString() == 'Traitement.'+json['etat'])
        ,json['note']

    );
  }

}