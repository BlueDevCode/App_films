

import 'package:flutter/material.dart';
import 'package:flutter_app_films/models/models.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier{

final String _apiKey= "4085efbdb9e4a6e25c6ab45437c0d02c";
final String _baseUrl= "api.themoviedb.org";
final String _language = "en-EN";

List<Movie> onDisplayMovies = [];
List<Movie> popularMovies = [];

int _popularPage = 0;

MoviesProvider(){
 
   getOnDisplayMovies();
   getPopularMovies() => null;
}
   Future<String>_getJsonData (String endpoint, [int page = 1   ]) async{
  var url = Uri.https(_baseUrl,endpoint,{
"api_key" :_apiKey,
"language":_language,
"page"    :"$page"
  });

final response = await http.get(url);
return response.body;

}

 getOnDisplayMovies() async {
  final jsonData = await _getJsonData("3/movie/now_playing");
 final   nowPlayingResponse  =    NowPlayingResponse.fromJson(jsonData);
//final Map<String, dynamic>  decodeData = json.decode(response.body);
onDisplayMovies = nowPlayingResponse.results;


notifyListeners();
 }


 getPopularMovies() async {
_popularPage ++;

final jsonData = await _getJsonData("3/movie/now_playing",_popularPage );

 var PopularResponse;
 final   popularResponse  = PopularResponse.fromJson(jsonData);
popularMovies = [...popularMovies, ...popularResponse.results];
notifyListeners();
}
}