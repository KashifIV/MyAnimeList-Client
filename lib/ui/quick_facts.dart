import 'package:flutter/material.dart';
import 'package:my_anime_list_client/data/anime.dart';
import 'package:my_anime_list_client/ui/StatTab.dart';

class QuickFacts extends StatelessWidget{
  
  Anime anime; 

  QuickFacts({this.anime}); 


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12),
    
      decoration: BoxDecoration(
        color: Colors.grey[800], 
        borderRadius: BorderRadius.circular(8)
      ),
      
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,

        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            

            children: <Widget>[
              StatTab(color: Colors.red, icon: Icons.satellite, value: anime.status,), 
              StatTab(color: Colors.teal, icon: Icons.tab, value: anime.showtype,), 

            ],
          ), 
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              StatTab(color: Colors.amber, icon: Icons.favorite, value: anime.favCount.toString()), 
              StatTab(color: Colors.green, icon: Icons.bookmark, value: anime.userCount.toString()),
            ],
          )
        ],
      ),
    );
  }
}