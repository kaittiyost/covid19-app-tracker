import 'package:flutter/material.dart';

class TelPhone extends StatefulWidget {
  const TelPhone({ Key? key }) : super(key: key);

  @override
  State<TelPhone> createState() => _TelPhoneState();
}

class _TelPhoneState extends State<TelPhone> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: 
      ListView(
        children: [
          Image.asset('asset/images/tel_covid.jpg', width: 200,height: 200,),
          SizedBox(height: 10,),
          ListTile(
            onTap: ()=>{},
            leading: Icon(Icons.person),
            title: Text('1422'),
            subtitle: Text('กรมควมคุมโรค'),
          ),
                    ListTile(
            onTap: ()=>{},
            leading: Icon(Icons.person),
            title: Text('1111'),
            subtitle: Text('ศูนย์บริการข้อมูลภาครัฐเพื่อประชาชน '),
          ),
                    ListTile(
            onTap: ()=>{},
            leading: Icon(Icons.person),
            title: Text('1669'),
            subtitle: Text('ศูนย์การแพทย์ฉุกเฉินแห่งชาติ (ศพฉ.)'),
          ),          
          ListTile(
            onTap: ()=>{},
            leading: Icon(Icons.person),
            title: Text('1506'),
            subtitle: Text('สำนักงานประกันสังคม (สปส.)'),
          ),
                    ListTile(
            onTap: ()=>{},
            leading: Icon(Icons.person),
            title: Text('1323'),
            subtitle: Text('สายด่วนสุขภาพจิต'),
          )
        ],
      ),
    );
  }
}