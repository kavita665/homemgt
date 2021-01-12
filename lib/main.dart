import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'pages/login.dart';
import 'pages/welcome_screen.dart';

import 'dart:core';

import 'package:homemgt/scoped_models/main.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
String deviceTheme = "light";
bool firstRun;

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.blue[700],
  primaryColorLight: Colors.blueAccent,
  accentColor: Colors.blueAccent,
);

final ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.grey[700],
    primaryColorLight: Colors.grey[850],
    accentColor: Colors.blue,
    textSelectionHandleColor: Colors.blue);

restartApp() {
  main();
}

logout() {
  if (deviceTheme == "light") {
    runApp(MyApp(lightTheme));
  } else {
    runApp(MyApp(darkTheme));
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SharedPreferences pref = await SharedPreferences.getInstance();
  String theme = (pref.getString("theme") ?? "light");
  deviceTheme = theme;
  if (theme == "dark") {
    runApp(MyApp(darkTheme));
  } else {
    runApp(MyApp(lightTheme));
  }
}

class MyApp extends StatefulWidget {
  final ThemeData theme;
  MyApp(this.theme);
  @override
  State<StatefulWidget> createState() {
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  MainModel model = MainModel();

  @override
  Widget build(BuildContext context) {
    return ScopedModel<MainModel>(
      model: model,
      child: MaterialApp(
        title: 'Money Monitor',
        home: _authenticateUser(model.loginUser, model),
        theme: widget.theme,
      ),
    );
  }
}

Widget _authenticateUser(Function loginUser, MainModel model) {
  return  StreamBuilder<User>(
    stream: _auth.authStateChanges(),
    builder: (BuildContext context, snapshot) {
      if (snapshot.connectionState == ConnectionState.waiting) {
        return _buildSplashScreen();
      } else {
        if (snapshot.hasData) {
          User user = snapshot.data;

          //Fetch User Data
          loginUser();
          return WelcomeScreen();
        }
        return LoginScreen();
      }
    },
  );
}

Widget _buildSplashScreen() {
  return Scaffold(
    body: Center(
      child: Text("Loading..."),
    ),
  );
}
