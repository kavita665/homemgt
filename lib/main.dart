import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:homemgt/balance.dart';
import 'package:homemgt/homepage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: HomePage(),
      //home: Balance(), 
      // theme: ThemeData(primarySwatch: Colors.red,brightness: Brightness.dark),
      // themeMode: ThemeMode.dark, 
       debugShowCheckedModeBanner: false,  
       );
  }
}
