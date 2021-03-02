//The Gray color that we use = Color.fromRGBO(49, 59, 52, 0.75),
//The Green color that we use = Color.fromRGBO(94, 217, 127, 1.0),

import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:yesil_umut/control.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String photoSaved = ""; //for saved message,
  TimeOfDay _time;

  TextEditingController nameController = TextEditingController();
  TextEditingController howManyPerDayController = TextEditingController();
  String birthdayController;
  TextEditingController timeController = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  void initState() {
    super.initState();
    _time = TimeOfDay.now();
    timeController.text = "00:00";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
              Column(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: MediaQuery.of(context).size.height / 7,
                  ),
                  Container(
                    //Question Container
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 30),

                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 50),
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: MediaQuery.of(context).size.height / 1.65,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(49, 59, 52, 0.75)),
                    child: ListView(
                      children: [
                        Column(
                          //inside Container
                          children: [
                            Text("Adınız ve Soyadınız :",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            35)),
                            Container(
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width / 1.5,
                              height: MediaQuery.of(context).size.height / 19,
                              child: TextField(
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            35),
                                controller: nameController,
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                      bottom:
                                          MediaQuery.of(context).size.height /
                                              15 /
                                              3,
                                      // HERE THE IMPORTANT PART
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                        )),
                                    fillColor: Colors.white,
                                    filled: true),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 45,
                            ),
                            Text("Doğum Tarihiniz :",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            35)),
                            AnimatedButton(
                                color: Colors.white,
                                height: MediaQuery.of(context).size.height / 23,
                                width: MediaQuery.of(context).size.width - 130,
                                child: Text(
                                    birthdayController == null
                                        ? ('Doğum Tarihi')
                                        : birthdayController,
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                35,
                                        color: Colors.black)),
                                onPressed: () {
                                  DatePicker.showDatePicker(context,
                                      showTitleActions: true,
                                      minTime: DateTime(1900, 1, 1),
                                      maxTime: DateTime(
                                          DateTime.now().year - 18,
                                          DateTime.now().month,
                                          DateTime.now().day),
                                      onChanged: (date) {}, onConfirm: (date) {
                                    setState(() {
                                      birthdayController =
                                          date.toString().split(' ').first;
                                    });
                                  },
                                      currentTime: DateTime.now(),
                                      locale: LocaleType.en);
                                }),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 45,
                            ),
                            Column(
                              children: [
                                Text("Günde Kaç Adet Sigara İçiyorsunuz ?",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.width /
                                                20)),
                                Container(
                                  //How many per day textfield's container
                                  alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width / 7,
                                  height:
                                      MediaQuery.of(context).size.height / 19,
                                  child: TextField(
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                35),
                                    controller: howManyPerDayController,
                                    decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                          bottom: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              15 /
                                              3,
                                          // HERE THE IMPORTANT PART
                                        ),
                                        border: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                            borderSide: BorderSide(
                                              color: Colors.transparent,
                                            )),
                                        fillColor: Colors.white,
                                        filled: true),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 45,
                            ),
                            Text("Hergün Saat Kaçta Kalkıyorsunuz ? : ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            38)),
                            Container(
                              //TimeController container
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width / 3,
                              height: MediaQuery.of(context).size.height / 19,
                              child: TextFormField(
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize:
                                        MediaQuery.of(context).size.height /
                                            35),
                                controller: timeController, // add this line.
                                decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(
                                      bottom:
                                          MediaQuery.of(context).size.height /
                                              15 /
                                              3,
                                      // HERE THE IMPORTANT PART
                                    ),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(10.0)),
                                        borderSide: BorderSide(
                                          color: Colors.transparent,
                                        )),
                                    fillColor: Colors.white,
                                    filled: true),
                                onTap: () async {
                                  TimeOfDay time = TimeOfDay.now();
                                  FocusScope.of(context)
                                      .requestFocus(new FocusNode());
                                  TimeOfDay picked = await showTimePicker(
                                      context: context, initialTime: time);
                                  if (picked != null && picked != time) {
                                    timeController.text = picked
                                        .format(context); // add this line.
                                    setState(() {
                                      time = picked;
                                    });
                                  }
                                },
                                validator: (value) {
                                  if (value.isEmpty) {
                                    return 'cant be empty';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 45,
                            ),
                            Column(
                              //People you love picture row
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Sevdiklerinizin Resmini Yükleyin : ",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize:
                                            MediaQuery.of(context).size.height /
                                                35)),
                                Column(
                                  children: [
                                    Container(
                                      child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              5,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              15,
                                          child: RaisedButton(
                                              color: Color.fromRGBO(
                                                  49, 59, 52, 0.75),
                                              onPressed: () =>
                                                  getImage(scaffoldKey),
                                              child: Icon(
                                                Icons.camera_alt,
                                                color: Color.fromRGBO(
                                                    94, 217, 127, 1.0),
                                              ))),
                                    ),
                                    Text(
                                      photoSaved,
                                      style: TextStyle(color: Colors.white),
                                    )
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                      margin: EdgeInsets.only(
                          top: MediaQuery.of(context).size.height / 30),
                      child: SizedBox(
                        //For continue button sizes !!!!!!!!!
                        width: MediaQuery.of(context).size.width / 3,
                        height: MediaQuery.of(context).size.height / 15,
                        child: RaisedButton(
                          color: Color.fromRGBO(49, 59, 52, 0.75),
                          onPressed: () => {
                            print(nameController.text),
                            print(howManyPerDayController.text),
                            print(birthdayController),
                            Navigator.pushReplacementNamed(context, '/control')
                          },
                          child: Text("Devam et!",
                              style: TextStyle(
                                  color: Color.fromRGBO(94, 217, 127, 1.0),
                                  fontSize:
                                      MediaQuery.of(context).size.height / 40)),
                        ),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future getImage(scaffold) async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        photoSaved = "Resminiz başarıyla kaydedildi!!!";
      });
      File imageFile = File(pickedFile.path);
      print(pickedFile.path);
    }
  }
}
