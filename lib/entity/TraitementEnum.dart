enum Traitement{
  BON_ETAT,MAL_ENTRETENU,CONDITION_MEDIOCRE,MAUVAIS_ETAT,VOITURE_MORTE,AUTRE
}
class TraitementEnum{

  static String enumToString(Traitement enumVal)
  {

    switch (enumVal){

      case Traitement.BON_ETAT:
        {
          return "En bon état";
        }
      case Traitement.MAL_ENTRETENU:
        {
          return "Mal entretenu";
        }
      case Traitement.CONDITION_MEDIOCRE:
        {
          return "Condition médiocre";
        }
      case Traitement.MAUVAIS_ETAT:
        {
          return "En mauvais état";
        }
      case Traitement.VOITURE_MORTE:
        {
          return "Voiture morte";
        }
      case Traitement.AUTRE:
        {
          return "Autre";
        }
    }
  }

}
