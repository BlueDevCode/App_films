


import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/movie.dart';
import '../providers/movies_provider.dart';

class MovieSearchDelegate extends SearchDelegate {
  
  @override
  
  ThemeData appBarTheme(BuildContext context){
   final ThemeData theme = Theme.of(context);
   return theme.copyWith(
      appBarTheme: theme.appBarTheme.copyWith(
        color: Colors.deepPurple,
      ),
      scaffoldBackgroundColor: const Color.fromARGB(255, 240, 221, 244),
      
    );
  }
  @override
  String get searchFieldLabel => 'Search movie';

  @override
  List<Widget> buildActions(BuildContext context) {
    
      return [
        IconButton(
          
          icon: const Icon( Icons.clear ),
          onPressed: () => query = '',
        )
      ];
  }
  
    @override
    Widget buildLeading(BuildContext context) {
      return IconButton(
        icon: const Icon( Icons.arrow_back ),
        onPressed: () {
          close(context, null );
        },
      );
    }
  
    @override
    Widget buildResults(BuildContext context) {
      
      return const Text('buildResults');
    }

    Widget _emptyContainer() {
       
      return const Center(  
        child: Icon( Icons.movie_creation_outlined, color: Colors.black38, size: 130, ),
      );
    }
  
    @override
    Widget buildSuggestions(BuildContext context) {
    
      if( query.isEmpty ) {
        return _emptyContainer();
      }
    
      final moviesProvider = Provider.of<MoviesProvider>(context, listen: false);
      moviesProvider.getSuggestionsByQuery( query );


      return FutureBuilder(
        future: moviesProvider.searchMovies(query),
        builder: ( _, AsyncSnapshot<List<Movie>> snapshot) {
          
          if( !snapshot.hasData ) return _emptyContainer();

          final movies = snapshot.data!;

          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: ( _, int index ) => _MovieItem( movies[index])
          );
        },
      );

  }

}


class _MovieItem extends StatelessWidget {

  final Movie movie;

  const _MovieItem( this.movie );

  @override
  Widget build(BuildContext context) {

    movie.heroId = 'search-${ movie.id }';

    return ListTile(
      leading: Hero(
        tag: movie.heroId!,
        child: FadeInImage(
          placeholder: const AssetImage('assets/no-image.jpg'), 
          image: NetworkImage( movie.fullPosterImg ),
          width: 50,
          fit: BoxFit.contain,
        ),
      ),
      title: Text( movie.title ),
      subtitle: Text( movie.originalTitle ),
      onTap: () {
        
        Navigator.pushNamed(context, 'details', arguments: movie );
      },
    );
  }
}