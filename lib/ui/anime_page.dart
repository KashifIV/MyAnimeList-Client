import 'package:flutter/material.dart';
import 'package:my_anime_list_client/data/anime.dart';
import 'package:my_anime_list_client/ui/anime_layout.dart';
class AnimePage extends StatefulWidget{
  final Anime anime; 
  AnimePage({@required this.anime}); 
  _AnimePage createState() => _AnimePage(); 
}
class _AnimePage extends State<AnimePage>{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimeLayout(anime: widget.anime,),
      backgroundColor: Colors.black,
    );
  } 
}