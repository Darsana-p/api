import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart'as http;
import '../models/movie.dart';
import 'package:flutter/material.dart';

class movie_provider with ChangeNotifier{
List<Movie>_movie=[];
List<Movie>get movies=>_movie;
Future<void>fetch_movie(
    String tocken
    )async{
  final url="https://hoblist.com/api/movieList";
  final response=await http.get(Uri.parse(url),
  headers:{'Authorization':'Bearer $tocken'}
  );
  if(response.statusCode==200){
    final Map<String, dynamic>jsondata=json.decode(response.body);
    final List<dynamic>moviesdata=jsondata['movies'];
    _movie=moviesdata.map((moviedata)=>Movie.fromJson(moviedata)).toList();
    notifyListeners();
  }else{
    throw Exception('unable to load movies list');
  }
}
}