import 'package:covid_tracker/screen/covidDashboard.dart';
import 'package:covid_tracker/screen/homePage.dart';
import 'package:covid_tracker/screen/loginPage.dart';
import 'package:covid_tracker/screen/profilePage.dart';
import 'package:covid_tracker/screen/qrHome.dart';
import 'package:covid_tracker/screen/qrReader.dart';
import 'package:covid_tracker/screen/registerPage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/LoginPage',
      routes: {
        '/LoginPage' : (context)=> LoginPage(),
        '/RegisterPage' : (context) => RegisterPage(),
        '/HomePage' : (context) => HomePage(),
        "/ProfilePage" : (context) => ProfilePage(),
        "/CovidDashboard" : (context) => CovidDashboard(),
        "/QrReader" : (context) => Qrreader()
      },
    );
  }
}