import 'package:flutter/material.dart';
import 'package:my_anime_list_client/domain/view_model.dart';
import 'package:my_anime_list_client/ui/carrousel.dart';
import 'package:my_anime_list_client/ui/carrousel_item.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:my_anime_list_client/ui/Bold_title_text.dart';
class NewAnimeCarrousel extends StatefulWidget{
  _NewAnimeCarrousel createState() => _NewAnimeCarrousel(); 
}
class _NewAnimeCarrousel extends State<NewAnimeCarrousel>{

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<ViewModel>( 
      builder: (context, child, model) => 
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          BoldTitleText(title: 'Upcoming Anime', fontSize: 20,),
          Carrousel(
            items: model.newAnime == null ? null : model.newAnime.where((test) => test.title_en != null).toList().map((item) => CarrouselItem(anime: item,)).toList(),
          )
        ]
      )
    );
  }
} 
