

import 'package:flutter/material.dart';

class MoviesProvider extends ChangeNotifier{

MoviesProvider(){
 
 print("moviesprovider inicializado");

   getOnDisplayMovies();

}

 getOnDisplayMovies() async {

  print("GetOnDisplayMovies");
 }



}