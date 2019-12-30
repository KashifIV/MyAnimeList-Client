import 'package:flutter/material.dart';
import 'package:my_anime_list_client/domain/view_model.dart';
import 'package:my_anime_list_client/ui/home_page.dart';
import 'package:scoped_model/scoped_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ScopedModel<ViewModel> (
      model: ViewModel.init(),
      child:MaterialApp(
        title: 'MyAnimeList',
        theme: ThemeData.dark(),
        home: HomePage(),
      )
    );
  }
}
