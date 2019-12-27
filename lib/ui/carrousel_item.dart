import 'package:flutter/material.dart';
import 'package:my_anime_list_client/ui/anime_page.dart';
class CarrouselItem extends StatelessWidget{
  final String imageURL, title;
  final double rating; 
  final int id; 
  CarrouselItem({this.imageURL, this.title, this.rating, this.id}); 

  @override
  Widget build(BuildContext context) {
    return Material( 
      elevation: 3,
      shadowColor: Colors.black,
      borderOnForeground: true,
      borderRadius: BorderRadius.all(Radius.circular(20)),
      clipBehavior: Clip.hardEdge,
      child: GestureDetector(
        onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context)=> AnimePage(id: this.id, title: this.title))),
        child: Container(
        height: 200,
        child: Stack(
          overflow: Overflow.clip,
          children: <Widget>[
            Image.network(this.imageURL), 
            Positioned(
              top: 170,
              left: 0,
              right: 0,
              height: 30,
              child: Container(
                color: Colors.white,
                child: Center(
                  child: Text(
                    this.title, 
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