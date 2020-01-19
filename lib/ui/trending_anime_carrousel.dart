import 'package:flutter/material.dart';
import 'package:my_anime_list_client/domain/view_model.dart';
import 'package:my_anime_list_client/ui/carrousel.dart';
import 'package:my_anime_list_client/ui/carrousel_item.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:my_anime_list_client/ui/Bold_title_text.dart';
class TrendingAnimeCarrousel extends StatefulWidget{
  _TrendingAnimeCarrousel createState() => _TrendingAnimeCarrousel(); 
}
class _TrendingAnimeCarrousel extends State<TrendingAnimeCarrousel>{

    @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ViewModel>( 
      builder: (context, child, model) => 
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BoldTitleText(title: 'Trending', fontSize: 20,),
          Carrousel(
            items: model.trendingAnime == null ? null : model.trendingAnime.where((test) => test.title_en != null).toList().map((item) => CarrouselItem(anime: item,)).toList(),
          )
        ]
      )
    );
  }
} 
