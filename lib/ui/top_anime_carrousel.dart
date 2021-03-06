import 'package:flutter/material.dart';
import 'package:my_anime_list_client/domain/view_model.dart';
import 'package:my_anime_list_client/ui/Bold_title_text.dart';
import 'package:my_anime_list_client/ui/carrousel.dart';
import 'package:my_anime_list_client/ui/carrousel_item.dart';
import 'package:scoped_model/scoped_model.dart';
class TopAnimeCarrousel extends StatefulWidget{
  _TopAnimeCarrousel createState() => _TopAnimeCarrousel(); 
}
class _TopAnimeCarrousel extends State<TopAnimeCarrousel>{

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ViewModel>( 
      builder: (context, child, model) => 
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BoldTitleText(title: 'Top Anime Currently Airing', fontSize: 20,),
          Carrousel(
            items: model.topAnime == null ? null : model.topAnime.where((test) => test.title_en != null).toList().map((item) => CarrouselItem(anime: item,)).toList(),
          )
        ]
      )
    );
  }
} 