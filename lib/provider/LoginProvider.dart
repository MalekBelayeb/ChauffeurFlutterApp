import 'dart:convert';
import 'package:chauffeur_app/entity/User.dart';
import 'package:chauffeur_app/utils/Constants.dart';
import "package:http/http.dart" as http;

class LoginProvider {

  static LoginProvider _instance = LoginProvider._();

  LoginProvider._();

  static LoginProvider get instance => _instance;

  var updateMissionsUrl = Constants.HOST+":"+Constants.PORT+"/authFF/signInChauffeur";
  var UpdateChauffeur = Constants.HOST+":"+Constants.PORT+"/authFF/UpdateChauffeur";
  var deleteAccountChauffeur = Constants.HOST+":"+Constants.PORT+"/authFF/deleteAccountChauffeur";

  List<User> parseUser(String responseBody) {

    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<User>((json) => User.fromJson(json)).toList();
  }

  Future<dynamic> loginChauffeur(String cin,String password) async {

    var response = await http.post(updateMissionsUrl,
        body: jsonEncode(
            {
              "cin":cin,
              "password":password,
            }
        ), headers: {"Content-Type": "application/json"});

    if(response.statusCode == 200)
      {

        return parseUser(response.body)[0];

      }else{

      return response.statusCode;

    }

  }


  Future<int> updateChauffeur(String id,String nom,String prenom) async {

    var response = await http.post(UpdateChauffeur,
        body: jsonEncode(
            {
              "idchauffeur":id,
              "nom":nom,
              "prenom":prenom
            }
        ), headers: {"Content-Type": "application/json"});

    return response.statusCode;


  }

  Future<int> deleteChauffeur(String id) async {

    var response = await http.post(deleteAccountChauffeur,
        body: jsonEncode(
            {

              "idchauffeur":id,

            }
        ), headers: {"Content-Type": "application/json"});

    return response.statusCode;


  }

}