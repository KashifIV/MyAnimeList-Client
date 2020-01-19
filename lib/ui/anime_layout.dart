import 'package:flutter/material.dart';
import 'package:my_anime_list_client/data/anime.dart';
import 'package:my_anime_list_client/ui/StatTab.dart';
import 'package:my_anime_list_client/ui/quick_facts.dart';
import 'package:my_anime_list_client/ui/trailer_container.dart';
class AnimeLayout extends StatefulWidget{
  final Anime anime; 
   AnimeLayout({this.anime});
  _AnimeLayout createState() => _AnimeLayout(); 
}
class _AnimeLayout extends State<AnimeLayout>{
  
  int _index; 
  void initState(){
    super.initState(); 
    _index = 0; 
  }
  Widget _imageSelection(BuildContext context){
    return Positioned( child: Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => GestureDetector(onTap: (){
          setState(() {
            _index = index; 
          });
        }, child:Image.network((widget.anime.posterImage == null )? FlutterLogo():widget.anime.posterImage.smallURL)),
        itemCount: 1,
        padding: EdgeInsets.fromLTRB(0, 0, 10, 0),
      ),
    ),
    bottom: 10, 
    ); 
  }
  List<Widget> _backgroundImage(BuildContext context){
    return <Widget>[
      
      Image.network(widget.anime.posterImage.largeURL, fit: BoxFit.fitWidth, width: MediaQuery.of(context).size.width,),
      Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.transparent, Colors.black], 
            begin: Alignment.center, 
            end: Alignment.bottomCenter, 
          )
        ),
      ),
    ];
  }
  Widget _title(BuildContext context){
    return Positioned(
      bottom: 30,

      child: Column(children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          width: MediaQuery.of(context).size.width,
          child:Text(
            widget.anime.title_canon, 
            style: TextStyle(
              fontSize: 40, 
              fontWeight: FontWeight.bold
            ),
          ), 
        ),
        SizedBox(height: 10), 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            StatTab(icon: Icons.calendar_today, value: widget.anime.startDate,), 
            StatTab(icon: Icons.star, color: Colors.orange, value: widget.anime.averageRating.toString(),), 
            StatTab(icon: Icons.ondemand_video, color: Colors.yellow, value: widget.anime.episodeCount.toString(),)
          ],
        )
      ],),
    );
  }
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height/1.5,
          width: MediaQuery.of(context).size.width,
          child: Stack(
            children: _backgroundImage(context)
              //..add(_imageSelection(context))
              ..add(_title(context))

          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(15, 0, 15, 10),
          child: Text(
            widget.anime.synopsis.toString()
          ),
          width: 700,
        ), 
        QuickFacts(anime: widget.anime,), 
        (widget.anime.trailer == null ) ? Text('no trailer') : TrailerContainer(widget.anime.trailer)
      ]
    );
  }
}