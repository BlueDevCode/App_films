



import '../providers/movies_provider.dart';
import '../Widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';



class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  

  @override
  Widget build(BuildContext context) {

final moviesProvider = Provider.of<MoviesProvider>(context);


    return  Scaffold(
      backgroundColor: const Color.fromARGB(255, 235, 204, 241),
      appBar: AppBar(
        title: const Text("Movies"),
        shadowColor: Color.fromARGB(22, 1, 1, 32),
        elevation: 0,
        actions: [
          IconButton(
          icon: const Icon(Icons.search_outlined),
          onPressed:(){}
         )
        ],
      ),
      body:SingleChildScrollView(

      child:  Column(
      
        children:  [
      CardSwiper( movies : moviesProvider.onDisplayMovies),
       MovieSlider(
       movies: moviesProvider.onDisplayMovies,
        title: "Popular",
       onNextPage: () => moviesProvider.getPopularMovies(),
      )

      ],)
      

      )
    );
  }
}