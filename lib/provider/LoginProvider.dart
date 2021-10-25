import 'dart:convert';
import 'package:chauffeur_app/entity/User.dart';
import 'package:chauffeur_app/utils/Constants.dart';
import "package:http/http.dart" as http;

class LoginProvider {

  static LoginProvider _instance = LoginProvider._();

  LoginProvider._();

  static LoginProvider get instance => _instance;

  var updateMissionsUrl = Constants.HOST+":"+Constants.PORT+"/authFF/signInChauffeur";

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

}