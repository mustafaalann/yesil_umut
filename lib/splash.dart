import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:yesil_umut/control.dart';
import 'package:yesil_umut/sign_in.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  bool doesexist = false;

  void initState() {
    checkFile();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SplashScreen(
      gradientBackground: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [Colors.green[900], Colors.blue[100]],
      ),

      seconds: 3,
      image: Image.asset(
          "assets/images/logo.png"), // Do not forget to declare the image into the pubspec.yaml
      loaderColor: Colors.black,
      photoSize: 125.0,
      navigateAfterSeconds: doesexist ? Control() : SignIn(),
    );
  }

  Future<String> getFilePath() async {
    Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
    String appDocumentsPath = appDocumentsDirectory.path;
    String filePath = '$appDocumentsPath/info.txt';
    return filePath;
  }

  void checkFile() async {
    File file = File(await getFilePath());
    print(file.path);
    try {
      String fileContent = await file.readAsString();
      print("FileContent = '" + fileContent + "'");
      setState(() {
        doesexist = true;
      });
    } on Exception catch (_) {
      setState(() {
        doesexist = false;
      });
    }
  }
}
