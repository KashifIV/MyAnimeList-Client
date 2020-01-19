import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:my_anime_list_client/data/anime.dart';

class KitsuAPI{
  String wire = "https://kitsu.io/api/edge"; 

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