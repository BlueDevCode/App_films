

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_app_films/models/models.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier{

final String _apiKey= "4085efbdb9e4a6e25c6ab45437c0d02c";
final String _baseUrl= "api.themoviedb.org";
final String _language = "en-EN";

List<Movie> onDisplayMovies = [];


MoviesProvider(){
 


   getOnDisplayMovies();

}

  popularMovies() => null;

 getOnDisplayMovies() async {
  var url = Uri.https(_baseUrl,"3/movie/now_playing",{
"api_key" :_apiKey,
"language":_language,
"page"    :"1"
  });

final response = await http.get(url);
 final   nowPlayingResponse  =    NowPlayingResponse.fromJson(response.body);
final Map<String, dynamic>  decodeData = json.decode(response.body);



onDisplayMovies = nowPlayingResponse.results;
notifyListeners();

 }
}