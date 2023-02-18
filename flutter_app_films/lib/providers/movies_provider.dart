

import 'package:flutter/material.dart';
import 'package:flutter_app_films/models/models.dart';
import 'package:flutter_app_films/models/search_response.dart';
import 'package:http/http.dart' as http;

class MoviesProvider extends ChangeNotifier{

final String _apiKey= "4085efbdb9e4a6e25c6ab45437c0d02c";
final String _baseUrl= "api.themoviedb.org";
final String _language = "en-EN";

List<Movie> onDisplayMovies = [];
List<Movie> popularMovies = [];

Map<int, List<Cast>>moviesCast = {};

int _popularPage = 0;

MoviesProvider(){
 
   getOnDisplayMovies();
   //getPopularMovies() => null;
}

  get suggestionStream => null;
   Future<String>_getJsonData (String endpoint, [int page = 1   ]) async{
  final url = Uri.https(_baseUrl,endpoint,{
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



Future < List<Cast>> getMovieCast( int movieId) async{

 if( moviesCast.containsKey(movieId) ) return moviesCast[movieId]!;

 final jsonData = await _getJsonData("3/movie/$movieId/credits");
 final creditsResponse = CreditsResponse.fromJson(jsonData);
   
moviesCast[ movieId] = creditsResponse.cast;

return creditsResponse.cast;
}

Future< List<Movie>> searchMovies (String query)async {

  final url = Uri.https(_baseUrl,"3/search/movie",{
"api_key" :_apiKey,
"language":_language,
"query": query
  
  });

final response = await http.get(url);
final searchResponse = SearchResponse.fromJson(response.body);
return searchResponse.results;

}

  void getSuggestionsByQuery(String query) {}


}