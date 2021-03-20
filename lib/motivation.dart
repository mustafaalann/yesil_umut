import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class Motivation extends StatefulWidget {
  @override
  _MotivationState createState() => _MotivationState();
}

class _MotivationState extends State<Motivation> {
  List<String> datas = ["", "", "", "", ""];

  @override
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
            SizedBox(
              height: MediaQuery.of(context).size.height / 20,
            ),
            Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color.fromRGBO(49, 59, 52, 0.75)),
                height: 200,
                width: MediaQuery.of(context).size.width / 2,
                //Image Inside The Container
                child: getImage()),
            Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height / 15,
                ),
                Text(
                  "'Hayatımı Sadece Ben Değiştirebilirim!",
                  style: TextStyle(
                      color: Color.fromRGBO(49, 59, 52, 0.75),
                      fontSize: MediaQuery.of(context).size.width / 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Kimse Benim İçin Bunu Yapamaz !!!'",
                  style: TextStyle(
                      color: Color.fromRGBO(49, 59, 52, 0.75),
                      fontSize: MediaQuery.of(context).size.width / 20,
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "Carol Burnett",
                  style: TextStyle(
                      color: Color.fromRGBO(94, 217, 127, 1.0),
                      fontSize: MediaQuery.of(context).size.width / 20,
                      fontWeight: FontWeight.bold),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget getImage() {
    if (datas[4] == "") {
      return Column();
    }
    return Image.file(
      new File(datas[4]),
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
    print(file.path);
    String fileContent = await file.readAsString();
    setState(() {
      datas = fileContent.split("*");
    });
    print(datas[4]);
    print('File Content: $fileContent');
  }
}
