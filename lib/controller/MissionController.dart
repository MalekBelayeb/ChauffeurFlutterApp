

import 'package:chauffeur_app/entity/Mission.dart';
import 'package:chauffeur_app/entity/User.dart';
import 'package:chauffeur_app/provider/MissionsProvider.dart';

class MissionController{

  static MissionController _instance = MissionController._();

  MissionController._();

  static MissionController get instance => _instance;

   Future<List<Mission>> getMissionList(User user)
  {

    return MissionProvider.instance.fetchMissions(user.id);

  }

  Future<bool> updateMission(Mission mission)
  {
    return MissionProvider.instance.updateMission(mission);
  }

}