

import 'package:chauffeur_app/entity/Mission.dart';
import 'package:flutter/material.dart';

class MissionController{

  static MissionController _instance = MissionController._();

  MissionController._();

  static MissionController get instance => _instance;

  List<Mission> missionList = <Mission>[];

  List<Mission> getMissionList()
  {

    this.missionList.clear();
    this.missionList.add(Mission("Peugeot","203","2012",DateTime.utc(2021,10,9),'102 TU 3254'));
    this.missionList.add(Mission("Peugeot","203","2012",DateTime.utc(2021,10,9),'102 TU 3254'));

    this.missionList.add(Mission("Ferrari","Panamera","2009",DateTime.utc(2021,10,23),'176 TU 4895'));
    this.missionList.add(Mission("Renault","Clio IV","2013",DateTime.utc(2021,09,12),'204 TU 1496'));
    this.missionList.add(Mission("Mercedes","Class s","2012",DateTime.utc(2021,10,19),'198 TU 6893'));

  return missionList;
  }

}