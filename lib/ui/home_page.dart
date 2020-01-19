import 'package:flutter/material.dart';
import 'package:my_anime_list_client/data/anime.dart';
import 'package:my_anime_list_client/domain/view_model.dart';
import 'package:my_anime_list_client/ui/appbar.dart';
import 'package:my_anime_list_client/ui/carrousel.dart';
import 'package:my_anime_list_client/ui/carrousel_item.dart';
import 'package:my_anime_list_client/ui/new_anime_carrousel.dart';
import 'package:my_anime_list_client/ui/top_anime_carrousel.dart';
import 'package:my_anime_list_client/ui/trending_anime_carrousel.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:tabbed_bottom_sheet/TabData.dart';
import 'package:tabbed_bottom_sheet/tabbed_bottom_sheet.dart';
class HomePage extends StatelessWidget{
  List<Anime> searchedAnime; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                  'Anime',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    fontSize: 30, 
                    fontWeight: FontWeight.bold,
                  ),
                ), 
            ), 
            TrendingAnimeCarrousel(), 
            SizedBox(height: 20,),
            TopAnimeCarrousel(), 
            SizedBox(height: 20,),
            NewAnimeCarrousel(),
            SizedBox(height: 20,), 
    
          ],
        ),
      ),
    );
  }
}