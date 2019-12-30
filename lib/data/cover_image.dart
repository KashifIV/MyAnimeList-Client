import 'package:flutter/material.dart';
class CoverImage{
  final String tinyURL, smallURL, largeURL, originalURL; 
  CoverImage({this.tinyURL, this.smallURL, this.largeURL, this.originalURL}); 
  factory CoverImage.fromMap(Map<String, dynamic> json){
    if (json == null){
      return null; 
    }
    return CoverImage(
      tinyURL: json['tiny'], 
      smallURL: json['small'], 
      largeURL: json['large'], 
      originalURL: json['original'] 
    );
  }
  Image get tiny => Image.network(tinyURL);
  Image get small => Image.network(smallURL); 
  Image get large => Image.network(largeURL); 
  Image get original => Image.network(originalURL); 

}