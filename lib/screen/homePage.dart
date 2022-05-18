import 'dart:ui';

import 'package:covid_tracker/screen/covidDashboard.dart';
import 'package:covid_tracker/screen/profilePage.dart';
import 'package:covid_tracker/screen/qrHome.dart';
import 'package:covid_tracker/screen/qrReader.dart';
import 'package:covid_tracker/screen/telPage.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
    int _currentIndex = 0; // home screen
    final List<Widget> _page = [CovidDashboard(),TelPhone(),Qrreader(), ProfilePage()];
    void onTabTapped(int index) {
      print("index" + index.toString());
      setState(() {
        _currentIndex = index;
      });
    }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Scaffold(
        body: _page[_currentIndex],
        appBar: AppBar(
          title: Text('Covid-19 Tracker'),
          actions: [
            IconButton(onPressed: ()=>{
              Navigator.pushNamed(context, "/LoginPage")
            }, icon: Icon(Icons.logout_rounded))
          ],
        ),
        bottomNavigationBar: SalomonBottomBar(
          currentIndex: _currentIndex,
          onTap: onTabTapped,
          items: [
            /// Home
            SalomonBottomBarItem(
              icon: Icon(Icons.home),
              title: Text("หน้าแรก"),
              selectedColor: Colors.blue,
            ),

            SalomonBottomBarItem(
              icon: Icon(Icons.phone_in_talk_rounded),
              title: Text("เบอร์"),
              selectedColor: Colors.pink,
            ),

            SalomonBottomBarItem(
              icon: Icon(Icons.qr_code_2_rounded),
              title: Text("แสกน"),
              selectedColor: Colors.pink,
            ),

            SalomonBottomBarItem(
              icon: Icon(Icons.person),
              title: Text("profile"),
              selectedColor: Colors.orange,
            ),

          ],
        ), 
      ),
    );
  }
}
