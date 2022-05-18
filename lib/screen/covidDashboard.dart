import 'package:covid_tracker/screen/profilePage.dart';
import 'package:flutter/material.dart';
import 'dart:convert' as convert;
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

import 'package:http/http.dart' as http;

class CovidDashboard extends StatefulWidget {
  const CovidDashboard({Key? key}) : super(key: key);

  @override
  _CovidDashboardState createState() => _CovidDashboardState();
}

class _CovidDashboardState extends State<CovidDashboard> {
  List data = [];
  var newCase;
  var new_death;
  var total_death;
  var total_case;
  Future<String> getData() async {
    try {
      var url =
          Uri.parse('https://covid19.ddc.moph.go.th/api/Cases/today-cases-all');
      //var url = Uri.http('172.16.0.42', 'https://covid19.ddc.moph.go.th/api/Cases/today-cases-all', {'q': '{http}'});
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body);
        print(jsonResponse);
        setState(() {
          data = jsonResponse;
          newCase = jsonResponse[0]['new_case'];
          new_death = jsonResponse[0]['new_death'];
          total_death = jsonResponse[0]['total_death'];
          total_case = jsonResponse[0]['total_case'];
        });
      } else {
        print('Request failed with status: ${response.statusCode}.');
      }
      return 'success';
    } catch (e) {
      return 'failed';
    }
  }

  @override
  void initState() {
    getData();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('asset/images/tel_covid2.jpg',),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            colors: [Colors.purple, Colors.blue])),
                    child: Column(
                      children: [
                        Text(
                          'ติดเชื้อเพิ่มวันนี้',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          newCase == null ? '...' : ' ${newCase} คน',
                          // ' ${newCase} คน',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient:
                            LinearGradient(colors: [Colors.green, Colors.blue])),
                    child: Column(
                      children: [
                        Text(
                          'ผู้ติดเชื้อรวม',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          newCase == null ? '...' : ' ${total_case} คน',
                          // ' ${newCase} คน',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient:
                            LinearGradient(colors: [Colors.red, Colors.pink])),
                    child: Column(
                      children: [
                        Text(
                          'เสียชีวิตทั้งหมด',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          newCase == null ? '...' : ' ${total_death} คน',
                          // ' ${newCase} คน',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: LinearGradient(
                            colors: [Colors.black87, Colors.grey])),
                    child: Column(
                      children: [
                        Text(
                          'เสียชีวิตวันนี้',
                          style: TextStyle(color: Colors.white),
                        ),
                        Text(
                          newCase == null ? '...' : ' ${new_death} คน',
                          // ' ${newCase} คน',
                          style: TextStyle(fontSize: 30, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Image.asset('asset/images/covid_logo2.png',width: 150,height: 150,),
          ],
        )
      ],
    );
  }
}
