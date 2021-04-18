import 'dart:io';
import 'package:table_calendar/table_calendar.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List _selectedEvents;
  Map<DateTime, List> _events;
  List<String> datas = ["", "", "", "", ""];
  CalendarController _calendarController = CalendarController();
  void initState() {
    super.initState();
    readFile();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 0.0),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Colors.blue[200], Colors.blue[50], Colors.blue[200]])),
      child: Padding(
        padding: EdgeInsets.all(MediaQuery.of(context).size.height / 40),
        child: ListView(
          children: [
            TableCalendar(
              events: _events,
              onDaySelected: (date, events, holidays) {
                _onDaySelected(date, events, holidays);
              },
              weekendDays: [],
              startingDayOfWeek: StartingDayOfWeek.monday,
              initialCalendarFormat: CalendarFormat.week,
              calendarController: _calendarController,
              calendarStyle: CalendarStyle(
                  canEventMarkersOverflow: true,
                  todayColor: Color.fromRGBO(49, 59, 52, 0.75),
                  selectedColor: Color.fromRGBO(94, 217, 127, 1.0),
                  todayStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0,
                      color: Colors.white)),
            ),
            Text(
              _calendarController.selectedDay.toString(),
            )
          ],
        ),
      ),
    );
  }

  Future<String> getFilePath() async {
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
    String appDocumentsPath = appDocumentsDirectory.path;
    String filePath = '$appDocumentsPath/info.txt';

    return filePath;
  }

  void readFile() async {
    File file = File(await getFilePath());
    String fileContent = await file.readAsString();
    setState(() {
      datas = fileContent.split("*");
    });
    print('File Content: $fileContent');
  }

  void _onDaySelected(DateTime day, List events, List holidays) {
    print('New Day Selected');
    setState(() {
      _selectedEvents = events;
    });
  }

  
}
