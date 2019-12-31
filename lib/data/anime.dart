import 'package:my_anime_list_client/data/cover_image.dart';

class Anime{
  final String createdAt, updatedAt, slug, synopsis, averageRating, ageRating; 
  final String title_en, title_en_jp, title_jp, title_canon;
  final int userCount, favCount, popularityRank, ratingRank, episodeCount; 
  final String trailer, status, subtype, showtype; 
  final String startDate, endDate; 
  final CoverImage coverImage, posterImage; 
  final bool nsfw; 

  Anime({
    this.createdAt, this.updatedAt, this.slug, this.synopsis, this.averageRating,
    this.ageRating, this.title_canon, this.title_en, this.title_en_jp, this.title_jp, this.nsfw,
    this.userCount, this.favCount, this.popularityRank, this.ratingRank, this.trailer, this.episodeCount, 
    this.status, this.subtype, this.showtype, this.startDate, this.endDate, this.coverImage, this.posterImage
  }); 

  factory Anime.fromMap(Map<String, dynamic> json){
    json = json['attributes'];
    return Anime(
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'], 
      slug: json['slug'], 
      synopsis: json['synopsis'], 
      title_en: json['titles'] == null ? null:  json['titles']['en'], 
      title_en_jp: json['titles'] == null ? null: json['titles']['en_jp'], 
      title_jp: json['titles'] == null ? null: json['titles']['ja_jp'], 
      title_canon: json['canonicalTitle'], 
      averageRating: json['averageRating'], 
      userCount: json['userCount'], 
      favCount: json['favoritesCount'], 
      startDate: json['startDate'],
      endDate: json['endDate'],
      popularityRank: json['popularityRank'], 
      ratingRank: json['ratingRank'], 
      ageRating: json['ageRatingGuide'], 
      subtype: json['subtype'],
      status: json['status'],
      posterImage: CoverImage.fromMap(json['posterImage']), 
      coverImage: CoverImage.fromMap(json['coverImage']), 
      episodeCount: json['episodeCount'], 
      showtype: json['showType'], 
      trailer: json['youtubeVideoId'], 
      nsfw: json['nsfw']
    );
  }


}