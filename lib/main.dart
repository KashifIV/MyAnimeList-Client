import 'package:flutter/material.dart';
import 'package:my_anime_list_client/ui/home_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyAnimeList',
      theme: ThemeData.dark(),
      home: HomePage(),
    );
  }
}
