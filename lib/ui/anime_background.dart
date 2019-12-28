import 'package:flutter/material.dart';

class AnimeBackground extends StatefulWidget{
  final List<String> images; 
  AnimeBackground({this.images});
  _AnimeBackground createState() => _AnimeBackground(); 
}

class _AnimeBackground extends State<AnimeBackground>{
  int _index; 
  void initState(){
    _index = 0; 
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.network(widget.images[_index]), 
      ]
    ); 
  }
}