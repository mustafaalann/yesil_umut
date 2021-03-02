import 'package:flutter/material.dart';


class Control extends StatefulWidget {
  @override
  _ControlState createState() => _ControlState();
}

class _ControlState extends State<Control> {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(backgroundColor: Color.fromRGBO(49, 59, 52, 0.75), title:Image.asset('assets/images/logo2.png', fit: BoxFit.cover,width: MediaQuery.of(context).size.height/15,),),
      body: Container(
        padding: EdgeInsets.only(top: 0.0),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.green[900], Colors.blue[100]])),
        child: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.height / 40),
          child: ListView(
            children: [

            ],
          ),
        ),
      ),
    );
  }

  
}
