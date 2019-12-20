import 'package:flutter/material.dart';
import 'package:my_anime_list_client/ui/appbar.dart';
import 'package:my_anime_list_client/ui/top_anime_carrousel.dart';
class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(20),
              child: Text(
                  'Anime',
                  style: TextStyle(
                    fontSize: 30, 
                    fontWeight: FontWeight.bold,

                  ),
                ), 
            ), 
            TopAnimeCarrousel()
          ],
        ),
      ),
    );
  }
}