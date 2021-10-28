import 'package:chauffeur_app/controller/MissionController.dart';
import 'package:chauffeur_app/entity/Mission.dart';
import 'package:chauffeur_app/entity/User.dart';
import 'package:chauffeur_app/utils/CustomPageRoute.dart';
import 'package:chauffeur_app/utils/StafimColors.dart';
import 'package:chauffeur_app/view/cells/MissionCell.dart';
import 'package:chauffeur_app/view/screens/MissionDetailScreen.dart';
import 'package:flutter/material.dart';

class MesAffectationsTabScreen extends StatefulWidget
{
  User user;
  MesAffectationsTabScreen(this.user);
  @override
  State<MesAffectationsTabScreen> createState() => _MesAffectationsTabScreenState();
}

class _MesAffectationsTabScreenState extends State<MesAffectationsTabScreen> {

  var items = [
    DropdownMenuItem(
        value: 1,
        child: Text("Non traités")
    ),DropdownMenuItem(
      value: 2,
      child: Text("Traités")
  )];

  List<Mission> listMissions = [];

  ValueNotifier<List<Mission>> missionsByType = ValueNotifier(<Mission>[]);
  int dropdownvalue = 1;

  List<Mission> getMissionByType(int dropdownvalue)
  {
    return listMissions.where((element) => dropdownvalue == 2 ? element.etat != null:element.etat == null ).toList();
  }

  @override
  void initState() {
    super.initState();

    this.loadMissions();

  }

  loadMissions()
  {
    MissionController.instance.getMissionList(this.widget.user).then((val) =>
    {
      this.listMissions = val,

      this.missionsByType.value = this.getMissionByType(this.dropdownvalue)
    });
  }
  @override
  void dispose() {
    missionsByType.dispose();
    super.dispose();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration:StafimColors.BACKGROUND_COLOR,
        child: Padding(
          padding: EdgeInsets.only(top: 20,left: 5),

          child: Column(

            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Mes Missions",style: TextStyle(
                    fontFamily: "peugeot-bold",
                    fontSize: 18,
                    color: Colors.black,
                  )),
                  DropdownButton(
                      value: dropdownvalue,
                      onChanged: (int? newValue) {
                        setState(() {

                          this.dropdownvalue = newValue!;

                        });
                       this.missionsByType.value = this.getMissionByType(this.dropdownvalue);
                      },
                      icon: Icon(Icons.keyboard_arrow_down),
                      items: items)
                ],),


              Expanded(child:
    ValueListenableBuilder<List<Mission>>(
    valueListenable: missionsByType,
    builder: (context, value, _) {
      return value.isEmpty ? Center(
        child: this.dropdownvalue == 1 ? Text("Pas de mission non traité disponible"):Text("Pas de mission traité disponible"),
      ):RefreshIndicator(
        onRefresh: () async {
          this.loadMissions();
        },
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding: EdgeInsets.all(8),
          itemCount: value.length,
          itemBuilder: (BuildContext context,int index) {
            Mission mission = value.elementAt(index);
            return GestureDetector(
              onTap: ()=>{

                Navigator.push(context, CustomPageRoute(MissionDetailScreen(mission)))

              },
              child: MissionCell(mission),
            );
          },
        ),
      );

    })

              )


            ],

          ),
        ),
      )
    );
  }
}
