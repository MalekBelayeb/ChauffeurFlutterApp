import 'dart:convert';
import 'package:chauffeur_app/entity/Mission.dart';
import 'package:chauffeur_app/utils/Constants.dart';
import "package:http/http.dart" as http;

class MissionProvider{

  static MissionProvider _instance = MissionProvider._();

  MissionProvider._();

  static MissionProvider get instance => _instance;

  var fetchMissionsUrl = Constants.HOST+":"+Constants.PORT+"/missionFF/getAllMissionsByChauffeur";
  var updateMissionsUrl = Constants.HOST+":"+Constants.PORT+"/missionFF/updateMission";

  List<Mission> parseMission(String responseBody) {

    final parsed = jsonDecode(responseBody).cast<Map<String, dynamic>>();

    return parsed.map<Mission>((json) => Mission.fromJson(json)).toList();
  }

  Future<List<Mission>> fetchMissions(String chauffeurId,[dynamic args]) async {

    var response = await http.post(fetchMissionsUrl,
        body: jsonEncode({"chauffeurId":chauffeurId}), headers: {"Content-Type": "application/json"});

    if (response.statusCode == 200) {

      return parseMission(response.body);

    } else {
      throw Exception(
          response.statusCode.toString() +
          " URI = " +
          response.request.url.toString());
    }
  }


  Future<bool> updateMission(Mission mission) async {

    var response = await http.post(updateMissionsUrl,
        body: jsonEncode(
            {
          "idmission":mission.id,
          "note":mission.etat != null? mission.etat!.note:"",
          "etat":mission.etat != null? mission.etat!.etat.toString().split('.').last:""
            }
        ), headers: {"Content-Type": "application/json"});

    return response.statusCode == 200;

  }


}