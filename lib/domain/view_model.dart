import 'package:my_anime_list_client/data/kitsu_api.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:my_anime_list_client/data/anime.dart';
class ViewModel extends Model{
  final KitsuAPI api;
  List<Anime> topAnime; 
  ViewModel({this.api}){
    getTopAnime(15);
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
}