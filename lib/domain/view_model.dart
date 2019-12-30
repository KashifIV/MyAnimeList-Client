import 'package:my_anime_list_client/data/kitsu_api.dart';
import 'package:scoped_model/scoped_model.dart';

class ViewModel extends Model{
  final KitsuAPI api;
  ViewModel({this.api});  
  factory ViewModel.init(){
    KitsuAPI api = KitsuAPI(); 
    api.getTopAnime(5);
    return ViewModel(
      api: api
    );
  }
}