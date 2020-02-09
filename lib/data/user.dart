
class User{
  String createdAt, name, slug, about, location, waifu, title; 
  int follwers, following, comments, favourites, liked, reviewed, likedRecieved, postCount; 
  int ratingCount; 

  User({this.createdAt, this.name, this.slug, this.about, this.location, this.waifu, this.title, 
  this.following, this.follwers, this.comments, this.favourites, this.liked, this.reviewed,
  this.likedRecieved, this.postCount, this.ratingCount}); 

  factory User.fromMap(Map<String, dynamic> json){
    return User(
      createdAt: json['createdAt'], 
      name: json['name'], 
      slug: json['slug'], 
      about: json['about'], 
      waifu: json['waifuOrHusbando'], 
      following: json['followingCount'], 
      follwers: json['followersCount'], 
      title: json['title'], 
      comments: json['commentsCount'], 
      favourites: json['favoritesCount'], 
      liked: json['likesGivenCount'], 
      postCount: json['postsCount'], 
      reviewed: json['reviewsCount'], 
      ratingCount: json['ratingsCount'], 
      
    );
  }
  
}