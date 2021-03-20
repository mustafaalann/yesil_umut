import 'package:flutter/material.dart';
import 'package:yesil_umut/home.dart';
import 'package:yesil_umut/motivation.dart';
import 'package:yesil_umut/settings.dart';

class Control extends StatefulWidget {
  @override
  _ControlState createState() => _ControlState();
}

class _ControlState extends State<Control> {
  int selectedPage = 0;
  List<Widget> _pages;
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  void initState() {
    super.initState();

    _pages = [Motivation(), Home(), Settings()];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
          flexibleSpace: Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                  Colors.green[300],
                  Color.fromRGBO(49, 59, 52, 0.75),
                  Color.fromRGBO(49, 59, 52, 0.75),
                  Color.fromRGBO(49, 59, 52, 0.75)
                ])),
          ),
          backgroundColor: Color.fromRGBO(49, 59, 52, 0.75),
          title: Image.asset(
            'assets/images/logo3.png',
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width / 2,
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.grey[400],
          backgroundColor: Color.fromRGBO(49, 59, 52, 0.75),
          currentIndex: selectedPage,
          selectedItemColor: Color.fromRGBO(94, 217, 127, 1.0),
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home_filled),
                title: Text("Ana Sayfa",
                    style: TextStyle(fontWeight: FontWeight.bold))),
            BottomNavigationBarItem(
                icon: Icon(Icons.smoke_free),
                title: Text(
                  "Hedefim",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )),
            BottomNavigationBarItem(
                icon: Icon(Icons.account_box),
                title: Text(
                  "Ayarlar",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ))
          ],
          onTap: (int clickedPage) {
            setState(() {
              selectedPage = clickedPage;
            });
          },
        ),
        body: _pages[selectedPage]);
  }
}

/*
Container(
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
          children: [],
        ),
      ),
    );
    */