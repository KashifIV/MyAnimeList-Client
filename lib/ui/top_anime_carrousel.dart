import 'package:flutter/material.dart';
import 'package:jikan_dart/jikan_dart.dart';
import 'package:my_anime_list_client/ui/carrousel.dart';
import 'package:my_anime_list_client/ui/carrousel_item.dart';
class TopAnimeCarrousel extends StatefulWidget{
  _TopAnimeCarrousel createState() => _TopAnimeCarrousel(); 
}
class _TopAnimeCarrousel extends State<TopAnimeCarrousel>{
  List<Top> topAnime; 
  JikanApi api; 
  void initState(){
    api = JikanApi(); 
    api.getTop(TopType.anime).then((value){
      setState(() {
        topAnime = value.toList(); 
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Carrousel(
      items: topAnime.map((item) => CarrouselItem(imageURL: item.imageUrl, title: item.title, rating: item.rank.toDouble(),)).toList(),
    );
  }
} 