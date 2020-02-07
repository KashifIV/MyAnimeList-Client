import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_anime_list_client/data/anime.dart';

import 'package:my_anime_list_client/const/constants.dart';
import 'package:my_anime_list_client/data/user.dart';

class KitsuAPI{
  String authentication; 

  String wire = "https://kitsu.io/api/edge"; 
  Future<bool> authenticateUser(String email, String password) async {
    String url = 'https://kitsu.io/api/oauth/token';
    http.Response response = await http.get("$url?grant_type=password&username=$email&password=<$email"); 
    print(json.decode(response.body)); 
    if (response.statusCode != 200){
      return false; 
    }
    authentication = json.decode(response.body)['access_token']; 
    return true; 
  }
  
  Future<User> getUser(){
    
  } 

  Future<List<Anime>> getTopAnime(int limit) async{
    http.Response response = await http.get(wire + "/anime?page[limit]=$limit&page[offset]=0&sort=popularityRank&filter[status]=current"); 
    List<dynamic> items = json.decode(response.body)['data']; 
    List<Anime> topAnime= items.map((item) => Anime.fromMap(item)).toList(); 
    return topAnime;
  }
  Future<List<Anime>> getTrendingAnime(int limit) async{
    http.Response response = await http.get(wire + "/trending/anime?page[limit]popularityRank=$limit&page[offset]=0"); 
    List<dynamic> items = json.decode(response.body)['data']; 
    List<Anime> topAnime= items.map((item) => Anime.fromMap(item)).toList(); 
    return topAnime;
  }
  Future<List<Anime>> getUpcomingAnime(int limit) async{
    http.Response response = await http.get(wire + "/anime?page[limit]popularityRank=$limit&page[offset]=0&filter[status]=upcoming&sort=popularityRank"); 
    List<dynamic> items = json.decode(response.body)['data']; 
    List<Anime> topAnime= items.map((item) => Anime.fromMap(item)).toList(); 
    return topAnime;
  }

  Future<List<Anime>> searchAnime(String query)async{
    http.Response response = await http.get(wire + "/anime?filter[text]=$query"); 
    List<dynamic> items = json.decode(response.body)['data']; 
    List<Anime> topAnime= items.map((item) => Anime.fromMap(item)).toList(); 
    return topAnime;
  }
}