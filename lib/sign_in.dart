//The Gray color that we use = Color.fromRGBO(49, 59, 52, 0.75),
//The Green color that we use = Color.fromRGBO(94, 217, 127, 1.0),
import 'package:animated_button/animated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:intl/intl.dart';
import 'dart:io';

String imagePath = "";
TextEditingController nameController = TextEditingController();
String birthdayController;

TextEditingController howManyPerDayController = TextEditingController();
TextEditingController timeController = TextEditingController();

String photoSaved = "(zorunlu değildir)"; //for saved message,
GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  int controlQuestion = 1;

  Widget controlContainer;

  @override
  Widget build(BuildContext context) {
    if (controlQuestion == 1) {
      controlContainer = Questions1();
    }
    if (controlQuestion == 2) {
      controlContainer = Questions2();
    }
    if (controlQuestion == 3) {
      controlContainer = Questions3();
    }
    return Scaffold(
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
                    width: MediaQuery.of(context).size.width / 2,
                  ),
                  Container(
                    //Question Container
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 30),
                    margin: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height / 50),
                    width: MediaQuery.of(context).size.width / 1.1,
                    height: MediaQuery.of(context).size.height / 3,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color.fromRGBO(49, 59, 52, 0.75)),
                    child: ListView(
                      children: [
                        Column(
                          //inside Container
                          children: [controlContainer],
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
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(49, 59, 52, 0.75),
                          ),
                          onPressed: () => {
                            if (controlQuestion != 3)
                              {
                                setState(() {
                                  controlQuestion = controlQuestion + 1;
                                }),
                                saveInformation()
                              }
                            else
                              {
                                saveFile(),
                                readFile(),
                                Navigator.pushReplacementNamed(
                                    context, '/control'),
                                saveInformation()
                              }
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
}

class Questions1 extends StatefulWidget {
  @override
  _Questions1State createState() => _Questions1State();
}

class _Questions1State extends State<Questions1> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text("Adınız ve Soyadınız :",
            style: TextStyle(
                color: Colors.white,
                fontSize: MediaQuery.of(context).size.height / 35)),
        Container(
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width / 1.5,
          height: MediaQuery.of(context).size.height / 19,
          child: TextField(
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: MediaQuery.of(context).size.height / 35),
            controller: nameController,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height / 15 / 3,
                  // HERE THE IMPORTANT PART
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
                fontSize: MediaQuery.of(context).size.height / 35)),
        AnimatedButton(
            color: Colors.white,
            height: MediaQuery.of(context).size.height / 23,
            width: MediaQuery.of(context).size.width - 130,
            child: Text(
                birthdayController == null
                    ? ('Doğum Tarihi')
                    : birthdayController,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 35,
                    color: Colors.black)),
            onPressed: () {
              DatePicker.showDatePicker(context,
                  showTitleActions: true,
                  minTime: DateTime(1900, 1, 1),
                  maxTime: DateTime(DateTime.now().year - 18,
                      DateTime.now().month, DateTime.now().day),
                  onChanged: (date) {}, onConfirm: (date) {
                setState(() {
                  birthdayController = date.toString().split(' ').first;
                });
              }, currentTime: DateTime.now(), locale: LocaleType.en);
            }),
      ],
    );
  }
}

class Questions2 extends StatefulWidget {
  @override
  _Questions2State createState() => _Questions2State();
}

class _Questions2State extends State<Questions2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timeController.text = "00:00";
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Text("Günde Kaç Adet Sigara İçiyorsunuz ?",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width / 20)),
            Container(
              //How many per day textfield's container
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width / 7,
              height: MediaQuery.of(context).size.height / 19,
              child: TextField(
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: MediaQuery.of(context).size.height / 35),
                controller: howManyPerDayController,
                decoration: InputDecoration(
                    contentPadding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height / 15 / 3,
                      // HERE THE IMPORTANT PART
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0)),
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
                fontSize: MediaQuery.of(context).size.height / 38)),
        Container(
          //TimeController container
          alignment: Alignment.center,
          width: MediaQuery.of(context).size.width / 3,
          height: MediaQuery.of(context).size.height / 19,
          child: TextFormField(
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: MediaQuery.of(context).size.height / 35),
            controller: timeController, // add this line.
            decoration: InputDecoration(
                contentPadding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).size.height / 15 / 3,
                  // HERE THE IMPORTANT PART
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    )),
                fillColor: Colors.white,
                filled: true),
            onTap: () async {
              TimeOfDay time = TimeOfDay.now();
              FocusScope.of(context).requestFocus(new FocusNode());
              TimeOfDay picked = await showTimePicker(
                  builder: (BuildContext context, Widget child) {
                    return MediaQuery(
                      data: MediaQuery.of(context)
                          .copyWith(alwaysUse24HourFormat: true),
                      child: child,
                    );
                  },
                  context: context,
                  initialTime: time);
              if (picked != null && picked != time) {
                timeController.text = picked.hour.toString() +
                    ":" +
                    picked.minute.toString(); // add this line.
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
      ],
    );
  }
}

class Questions3 extends StatefulWidget {
  @override
  _Questions3State createState() => _Questions3State();
}

class _Questions3State extends State<Questions3> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          //People you love picture row
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Motivasyon için Sevdiklerinizin",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height / 35)),
            Text("resmini yüklemek ister misiniz ?",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height / 35)),
            SizedBox(
              height: MediaQuery.of(context).size.height / 15,
            ),
            Text("Sevdiklerinizin Resmini Yükleyin : ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height / 35)),
            Column(
              children: [
                Container(
                  child: SizedBox(
                      width: MediaQuery.of(context).size.width / 5,
                      height: MediaQuery.of(context).size.height / 15,
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromRGBO(49, 59, 52, 0.75),
                          ),
                          onPressed: () => getImage(scaffoldKey),
                          child: Icon(
                            Icons.camera_alt,
                            color: Color.fromRGBO(94, 217, 127, 1.0),
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
    );
  }

  Future getImage(scaffold) async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        photoSaved = "Resminiz başarıyla kaydedildi!!!";
      });
      //File imageFile = File(pickedFile.path);
      imagePath = pickedFile.path;
      print(pickedFile.path);
    } else {
      imagePath = "";
    }
  }
}

saveInformation() {
  print(nameController.text);
  print(birthdayController);
  print(howManyPerDayController.text);
  print(timeController.text);
}

Future<String> getFilePath() async {
  Directory appDocumentsDirectory = await getApplicationDocumentsDirectory();
  String appDocumentsPath = appDocumentsDirectory.path;
  String filePath = '$appDocumentsPath/info.txt';

  return filePath;
}

void saveFile() async {
  File file = File(await getFilePath());
  print(file.path);
  String name = "";
  String birthday = "";
  String howmanyperday = "";
  String time = "";
  String image = "";

  try {
    name = nameController.text;
    birthday = birthdayController;
    howmanyperday = howManyPerDayController.text;
    time = timeController.text;
    image = imagePath;
  } on Exception catch (_) {
    print("problem about filling the fields");
  }
  file.writeAsString(
      name + "*" + birthday + "*" + howmanyperday + "*" + time + "*" + image);
}

void readFile() async {
  File file = File(await getFilePath());
  print(file.path);
  String fileContent = await file.readAsString();
  print('File Content: $fileContent');
}
