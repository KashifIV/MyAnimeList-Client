import 'package:flutter/material.dart';
import 'package:jikan_dart/jikan_dart.dart';
import 'package:my_anime_list_client/ui/anime_layout.dart';
class AnimePage extends StatefulWidget{
  final int id; 
  final String title, startDate; 
  final int episodes;
  final double score;
  AnimePage({this.id, this.title, this.episodes, this.score, this.startDate}); 
  _AnimePage createState() => _AnimePage(); 
}
class _AnimePage extends State<AnimePage>{
  
  MoreInfo animeInfo; 
  List<Picture> images; 
  Stats animeStats; 

  void initState(){
    super.initState(); 
    loadEssentialInfo(); 
  }
  void loadEssentialInfo(){
    JikanApi api = JikanApi(); 
    api.getAnimePictures(widget.id).then((onValue){
      setState(() {
        images = onValue.toList();
      });
    }); 
    api.getAnimeMoreInfo(widget.id).then((onValue){
      setState(() {
        animeInfo = onValue;
      });
    }); 
    //api.getAnimeStats(widget.id).then((onValue) => animeStats = onValue); 
  }
  Widget pageHandler(){
    if (images == null || animeInfo == null){
      return Center(child: CircularProgressIndicator(),); 
    }
    return AnimeLayout(animeInfo: animeInfo, images: images, title: widget.title, episodes: widget.episodes, score: widget.score, startDate: widget.startDate,);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: pageHandler(),
      backgroundColor: Colors.black,
    );
  } 
}