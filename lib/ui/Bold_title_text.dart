import 'package:flutter/material.dart';

class BoldTitleText extends StatelessWidget{

  final String title; 
  final double fontSize; 
  BoldTitleText({this.title, this.fontSize});
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.all(14),
      child: Text(
          title,
          textAlign: TextAlign.start,
          style: TextStyle(
            fontSize: (fontSize == null) ? 20 : fontSize, 
            fontWeight: FontWeight.bold,
          ),
        ), 
    ); 
  }
}