import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class TrailerContainer extends StatefulWidget{
  String url; 
  TrailerContainer(this.url); 
  _TrailerContainer createState() => _TrailerContainer(); 
}

class _TrailerContainer extends State<TrailerContainer>{
  YoutubePlayerController _controller; 
  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.url, 
      flags: YoutubePlayerFlags(
        autoPlay: false, 
        mute: false,
      )
    ); 
  }
  @override
  Widget build(BuildContext context) {
    try{
      return Container(
        padding: EdgeInsets.symmetric(vertical: 15),
      
        child: YoutubePlayer(
          controller: _controller, 
          showVideoProgressIndicator: true, 
        )
      );
    }catch(e){
      return Container(child: Text('Could not Load Trailer'),);
    }
  }
}