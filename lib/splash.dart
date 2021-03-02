import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:yesil_umut/sign_in.dart';



class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SplashScreen(
      gradientBackground: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: [Colors.green[900],Colors.blue[100]],
      ),

      seconds: 3,
      image: Image.asset(
          "assets/images/logo.png"), // Do not forget to declare the image into the pubspec.yaml
      loaderColor: Colors.black,
      photoSize: 125.0,
      navigateAfterSeconds: SignIn(),
    );
  }
}
