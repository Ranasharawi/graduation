import 'package:flutter/material.dart';

class Ay7aga extends StatefulWidget {


  @override
  _Ay7agaState createState() => _Ay7agaState();
}

class _Ay7agaState extends State<Ay7aga> {
  bool darkMode=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Ranoon'),
        actions: [
          IconButton( onPressed: (){
            setState(() {
              
            });
          },
            icon: Icon(
              darkMode?Icons.brightness_4_outlined:Icons.brightness_5_rounded
      ,
    ),
          )
        ],
      ),
      body:
      Center(
        child: Column(
          children: [
            Icon(Icons.tune),
            Text('Rana Elsharawy',
            style: Theme.of(context).textTheme.bodyText1

            )],
        ),
      ),

    );
  }
}
