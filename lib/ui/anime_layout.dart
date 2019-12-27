import 'package:flutter/material.dart';
import 'package:jikan_dart/jikan_dart.dart';

class AnimeLayout extends StatelessWidget{
  final MoreInfo animeInfo; 
  final List<Picture> images; 
  final Stats animeStats; 

  AnimeLayout({this.animeInfo, this.images, this.animeStats}); 


  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          height: 500,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Image.network(images[index].large),
            itemCount: images.length,
            //padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
          ),
        ), 
        Container(
          child: Text(
            animeInfo.toJson()
          ),
          width: 700,
        )
      ]
    );
  }
}