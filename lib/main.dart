import 'package:flutter/material.dart';
import 'control.dart';
import 'splash.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new Splash(),
    routes: {
          '/control': (_) => new Control(),
        },
  ));
}