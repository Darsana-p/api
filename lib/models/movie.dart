/// YApi QuickType插件生成，具体参考文档:https://plugins.jetbrains.com/plugin/18847-yapi-quicktype/documentation

import 'dart:convert';

dynamic movieFromJson(String str) => json.decode(str);
String movieToJson(dynamic data) => json.encode(data);

class Movie {
  Movie({
    required this.category,
    required this.language,
    required this.sort,
    required this.genre,
});
  String category;
  String language;
  bool sort;
  String genre;

  factory Movie.fromJson(Map<dynamic,dynamic>json)=>Movie(
  category: json['category'],
  language: json['language'],
  sort: json['sort'],
  genre: json['genre']
  );
Map<dynamic,dynamic>toJson()=>{
  "category":category,
  "language":language,
  "sort":sort,
  };
}