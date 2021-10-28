
import 'package:chauffeur_app/entity/User.dart';
import 'package:chauffeur_app/provider/LoginProvider.dart';

class LoginController
{

  static LoginController _instance = LoginController._();

  LoginController._();

  static LoginController get instance => _instance;

  Future<dynamic> SignInChauffeur(String cin,String password) async {

    return await LoginProvider.instance.loginChauffeur(cin, password);
  }

  Future<dynamic> SignUpChauffeur(String cin,String nom,String prenom,String password) async {

    return await LoginProvider.instance.signUpChauffeur( cin, nom, prenom, password);
  }


  Future<int> updateChauffeur(String id,String nom,String prenom) async {

    return await LoginProvider.instance.updateChauffeur(id, nom, prenom);
  }

  Future<int> deleteChauffeur(String id) async {

    return await LoginProvider.instance.deleteChauffeur(id);
  }

  }