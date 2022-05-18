import 'dart:ui';

import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          SizedBox(
            height: 30,
          ),
          Container(
            width: 200,
            height: 200,
            decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                    fit: BoxFit.contain,
                    image: new AssetImage('asset/images/profile2.jpg'))),
          ),
          SizedBox(
            height: 20,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Created by'),
              SizedBox(
                height: 20,
              ),
              Text('Kiattiyot Sihawong' , style: TextStyle(fontSize: 25),),
                            SizedBox(
                height: 20,
              ),
              Text('ID 62011211004' , style: TextStyle(fontSize: 15),),
                            SizedBox(
                height: 10,
              ),
              Text('Information Technology' , style: TextStyle(fontSize: 15),),
                                         SizedBox(
                height: 10,
              ),
              Text('Mahasarakham University' , style: TextStyle(fontSize: 15),)
            ],
          ),
        ],
      ),
    );
  }
}
