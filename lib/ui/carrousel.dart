import 'package:flutter/material.dart';

class Carrousel extends StatelessWidget{
  final List<Widget> items;
  Carrousel({this.items = const [CircularProgressIndicator()]}); 

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: items
      )
    );
  }
}