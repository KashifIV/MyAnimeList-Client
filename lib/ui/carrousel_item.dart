import 'package:flutter/material.dart';
import 'package:my_anime_list_client/data/anime.dart';
import 'package:my_anime_list_client/ui/anime_page.dart';
class CarrouselItem extends StatelessWidget{
  final Anime anime; 
  CarrouselItem({@required this.anime}); 

  @override
  Widget build(BuildContext context) {
    return Material( 
      elevation: 3,
      shadowColor: Colors.black,
      borderOnForeground: true,
      borderRadius: BorderRadius.all(Radius.circular(20)),
      clipBehavior: Clip.hardEdge,
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=> 
          AnimePage(anime: anime,))),
        child: Container(
        height: 200,
        child: Stack(
          overflow: Overflow.clip,
          children: <Widget>[
            (anime.posterImage == null) ? FlutterLogo(): anime.posterImage.large, 
            Positioned(
              top: 170,
              left: 0,
              right: 0,
              height: 30,
              child: Container(
                color: Colors.white,
                child: Center(
                  child: Text(
                    anime.title_en, 
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black
                      
                    ),
                  ),
                ),
              ),
            )
          ],
        ), 
        decoration: BoxDecoration(
          //borderRadius: BorderRadius.all(Radius.circular(20)),
          //border: Border.all(color: Colors.red)
        ),
    )));
  }
}