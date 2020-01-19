import 'package:flutter/material.dart';
import 'package:my_anime_list_client/data/kitsu_api.dart';
import 'package:my_anime_list_client/ui/searched_anime.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:my_anime_list_client/data/anime.dart';
import 'package:tabbed_bottom_sheet/TabData.dart';
import 'package:tabbed_bottom_sheet/tabbed_bottom_sheet.dart';
class ViewModel extends Model{
  final KitsuAPI api;
  List<Anime> topAnime;
  List<Anime> newAnime;
  List<Anime> trendingAnime;  
  List<Anime> searchedAnime;  
  ViewModel({this.api}){
    getTopAnime(15);
    getNewAnime(15);
    getTrendingAnime(15);
  }

  factory ViewModel.init(){
    KitsuAPI api = KitsuAPI(); 
    return ViewModel(
      api: api
    );
  }

  Future<List<Anime>> getTopAnime(int limit) async{
    topAnime = await api.getTopAnime(limit);
    notifyListeners(); 
    return topAnime; 
  }

  Future<List<Anime>> getTrendingAnime(int limit) async{
    trendingAnime = await api.getTrendingAnime(limit);
    notifyListeners(); 
    return trendingAnime; 
  }

  Future<List<Anime>> getNewAnime(int limit) async {
    newAnime = await api.getUpcomingAnime(limit);
    notifyListeners(); 
    return newAnime; 
  }

  Future<bool> submitSearch(String query, BuildContext context) async{
    searchedAnime = await api.searchAnime(query); 
    if (searchedAnime == null){
      return false; 
    }
    notifyListeners(); 
    searchedAnime.forEach((item) => print(item.title_canon));
    SearchedAnime view = SearchedAnime(searchedAnime);  
    TabbedBottomSheet.open(context: context, tabsData: [TabData(icon: Icon(Icons.tv), text: Text(query), activeColor: Colors.black.withAlpha(200)) ], children: [
      view.view()
    ]); 
    return true; 
    
  }

}