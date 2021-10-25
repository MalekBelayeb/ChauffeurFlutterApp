

class Vehicule{

String matricule,couleur,modele,annee,marque;
Vehicule(this.matricule,this.couleur,this.modele,this.annee,this.marque);

factory Vehicule.fromJson(Map<String, dynamic> json)
{
  return Vehicule(
          json['matricule']
          ,json['couleur']
          ,json['modele']
          ,json['date']
          ,json['marque']
      );
}
}