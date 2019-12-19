import 'package:flutter/material.dart';
import 'package:my_anime_list_client/ui/appbar.dart';

class HomePage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppbar(),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Text('Anime')
          ],
        ),
      ),
    );
  }
}