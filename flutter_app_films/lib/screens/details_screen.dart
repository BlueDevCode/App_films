

import 'package:flutter/material.dart';

class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key});

  

  @override
  Widget build(BuildContext context) {

    final String movie = ModalRoute.of(context)?.settings.arguments.toString() ?? "no-movie";
    
    return   Scaffold(
      
      body: CustomScrollView(
        slivers: [
          _CustomAppbar()

        ],
      )
    );
  }
}
class  _CustomAppbar extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return const SliverAppBar(
backgroundColor: Colors.green,
expandedHeight: 200,
floating: false,
pinned:true,
flexibleSpace: FlexibleSpaceBar(

centerTitle: true,
title: Text("movie.title"),
background: FadeInImage(
 placeholder: AssetImage("assets/loading.gif"),
image: NetworkImage ("https://via.placeholder.com/500x300"),
fit:BoxFit.cover,
),
)

    );
  }
}