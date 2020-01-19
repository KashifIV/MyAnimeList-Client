import 'package:flutter/material.dart';
import 'package:my_anime_list_client/data/anime.dart';
import 'package:my_anime_list_client/ui/StatTab.dart';
import 'package:my_anime_list_client/ui/anime_page.dart';
class SearchedItem extends StatelessWidget{
  final Anime anime; 

  SearchedItem(this.anime); 


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> 
          AnimePage(anime: anime,))),
      child: Card(
      
      elevation: 2,
      color: Colors.grey[800],
      child: Row(
        children: <Widget>[
        Container(
          width: 140,
          child: anime.posterImage.large,
        ),
        SizedBox(width: 20,),
        Container( 
        child:Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              anime.title_canon, 
              style: TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.bold
              ),
            ),
            SizedBox(height: 10,),
            Row(children: <Widget>[
              StatTab(color: Colors.yellow, icon: Icons.ondemand_video, value: anime.episodeCount.toString(),),
              StatTab(color: Colors.orange, value: anime.ratingRank.toString(), icon: Icons.star,),
            ],crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start,), 
            SizedBox(height: 10,), 
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width - 200,
              child:Text(anime.synopsis)
            )
        ],))
      ],),
    ));
  }
}