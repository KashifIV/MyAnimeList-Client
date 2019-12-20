import 'package:flutter/material.dart';

class CarrouselItem extends StatelessWidget{
  final String imageURL, title;
  final double rating; 

  CarrouselItem({this.imageURL, this.title, this.rating}); 

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Stack(
        children: <Widget>[
          Image.network(this.imageURL), 
          Positioned(
            top: 170,
            child: Container(
              color: Colors.white,
              child: Center(
                child: Text(
                  this.title, 
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
        borderRadius: BorderRadius.all(Radius.circular(20))
      ),
    );
  }
}