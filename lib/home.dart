import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
          children: [Text("PAGE HOME")],
        ),
      ),
    );
  }
}
