

import 'package:chauffeur_app/entity/Mission.dart';
import 'package:chauffeur_app/provider/MissionsProvider.dart';

class MissionController{

  static MissionController _instance = MissionController._();

  MissionController._();

  static MissionController get instance => _instance;

   Future<List<Mission>> getMissionList()
  {

    return MissionProvider.instance.fetchMissions('617480edea13dd38f0d98bb6');

  }

  Future<bool> updateMission(Mission mission)
  {
    return MissionProvider.instance.updateMission(mission);
  }

}