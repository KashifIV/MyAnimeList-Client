import 'package:flutter/material.dart';
import 'package:my_anime_list_client/ui/home_page.dart';
import 'package:my_anime_list_client/ui/login.dart';
class MyDrawer extends StatelessWidget{

  Map<String, Widget> items = {'Home': HomePage(), 'Login': LoginPage()};  

  List<Widget> tiles(BuildContext context){
    List<Widget> tiles = []; 
    items.forEach((key, value) {
      tiles.add(
        ListTile(
          title: Text(key), 
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => value)),
        )
      );
    });
    return tiles; 
  }

  @override
  Widget build(BuildContext context) {

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            child: Text('My Anime List'), 
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ), 
        ]..addAll(tiles(context)),
      )
    );
  }
}