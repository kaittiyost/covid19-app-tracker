import 'package:flutter/material.dart';

class QrHome extends StatefulWidget {
  const QrHome({ Key? key }) : super(key: key);

  @override
  State<QrHome> createState() => _QrHomeState();
}

class _QrHomeState extends State<QrHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(child: Column(children: [
        SizedBox(height: 20,),
        ElevatedButton(onPressed: ()=>{
           Navigator.pushNamed(context, '/QrReader')
        }, child: Text('Scan หมอพร้อม'))
      ],),),
    );
  }
}