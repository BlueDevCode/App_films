
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

class MoviesProvider extends ChangeNotifier{
final String _apiKey= "4085efbdb9e4a6e25c6ab45437c0d02c";
final String _baseUrl= "api.themoviedb.org";
final String _language = "en-EN";



MoviesProvider(){
 
 print("moviesprovider inicializado");

   getOnDisplayMovies();

}

 getOnDisplayMovies() async {
  var url = Uri.https(_baseUrl,"3/movie/now_playing",{
"api_key":_apiKey,
"language":_language,
"page":"1"
  });

final response = await http.get(url);

print(response.body);
 }



}