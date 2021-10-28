import 'package:badges/badges.dart';
import 'package:chauffeur_app/controller/MissionController.dart';
import 'package:chauffeur_app/entity/Mission.dart';
import 'package:chauffeur_app/entity/User.dart';
import 'package:chauffeur_app/utils/CustomPageRoute.dart';
import 'package:chauffeur_app/view/cells/MissionCell.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

import '../MissionDetailScreen.dart';


class CalendrierTabScreen extends StatefulWidget
{
  User user;
  CalendrierTabScreen(this.user);
  @override
  State<CalendrierTabScreen> createState() => _CalendrierTabScreenState();
}

class _CalendrierTabScreenState extends State<CalendrierTabScreen> {
  List<Mission> missions = [];

  late ValueNotifier<List<Mission>> missionByDate = ValueNotifier(<Mission>[]);

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  CalendarFormat _calendarFormat = CalendarFormat.month;

  @override
  void initState() {

    super.initState();

    MissionController.instance.getMissionList(this.widget.user).then((val) =>
    {

      this.missions = val,

      missionByDate = ValueNotifier(this.dayDidSelected( this._selectedDay!=null ? this._selectedDay!:this._focusedDay)),

    });

  }

  @override
  void dispose() {
    missionByDate.dispose();
    super.dispose();
  }

  List<Mission> dayDidSelected(DateTime date)
  {
    return missions.where((element) => element.date.day == date.day && element.date.month == date.month && element.date.year == date.year).toList();
  }


  Widget markMissionOnCalendar(DateTime day)
  {
    int count = missions.where((element) => element.date.day == day.day && element.date.month == day.month && element.date.year == day.year).length;


    if (count > 0) {
      return Center(
          child:
          Badge(

            child: Text(day.day.toString()),
            position: BadgePosition.topEnd(top: 10, end: -10),
            animationType: BadgeAnimationType.slide,
            toAnimate: true,
            animationDuration: Duration(seconds: 2),
            badgeContent: Text(count.toString()),
            badgeColor: Color.fromRGBO(0,191,191, 1),
            

          )
      );
    }else{
      return Center(child: Text(day.day.toString()));
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(

        children: [
          TableCalendar(
            firstDay: DateTime.utc(2010, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: _focusedDay,
            calendarFormat: _calendarFormat,

            selectedDayPredicate: (day) {

              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              if (!isSameDay(_selectedDay, selectedDay)) {

                setState(() {
                  _selectedDay = selectedDay;
                  _focusedDay = focusedDay;
                });

                if(_selectedDay == null)
                  {

                    this.missionByDate.value = this.dayDidSelected(focusedDay);

                  }else{

                    this.missionByDate.value = this.dayDidSelected(_selectedDay!);

                }
              }
            },
            onFormatChanged: (format) {
              if (_calendarFormat != format) {

                setState(() {
                  _calendarFormat = format;
                });
              }
            },
            onPageChanged: (focusedDay) {

              _focusedDay = focusedDay;
            },

            calendarBuilders: CalendarBuilders(
                todayBuilder: (context,day,tday){return markMissionOnCalendar(day);} ,
                defaultBuilder: (context,day,tday)
                {
                  return markMissionOnCalendar(day);
                }
            ),

          ),
          Expanded(
            child: ValueListenableBuilder<List<Mission>>(
              valueListenable: missionByDate,
              builder: (context, value, _) {
                return ListView.builder(
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
                );
              },
            ),
          ),
        ],
      )
    );
  }
}
