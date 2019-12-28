import 'package:flutter/material.dart';

class StatTab extends StatelessWidget{
  final IconData icon; 
  final String value; 
  final Color color; 
  StatTab({this.icon, this.value, this.color = Colors.white});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(children: <Widget>[
        
        Icon(icon, color: this.color,),
        SizedBox(width: 5,), 
        Text(value) 

      ],
      //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      ) 
    );
  }
}