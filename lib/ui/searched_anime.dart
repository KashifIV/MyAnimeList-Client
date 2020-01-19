import 'package:flutter/material.dart';
import 'package:my_anime_list_client/ui/search_item.dart';
import 'package:my_anime_list_client/data/anime.dart';
class SearchedAnime{
  final List<Anime> anime; 
  SearchedAnime(this.anime); 

  Widget view(){
    return Container(child: ListView.builder(
      itemCount: anime.length, 
      itemBuilder: (context, index) => SearchedItem(anime[index]),
    ), color: Colors.black,);
  }

}
