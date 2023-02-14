

import 'package:flutter/material.dart';
import 'package:flutter_app_films/Widgets/widgets.dart';

import '../models/models.dart';

        class DetailsScreen extends StatelessWidget {
        const DetailsScreen({super.key});

  

         @override
         Widget build(BuildContext context) {

    final Movie movie= ModalRoute.of(context)!.settings.arguments as Movie ;
    
    
        return Scaffold(
      
           body: CustomScrollView(
           slivers: [
             _CustomAppbar (movie),
              SliverList(
               delegate: SliverChildListDelegate([
               _PosterAndTitle( movie ),
                _OverView(),
              _OverView(),
               _OverView(),   
               const CastingCards(),
               ])
              )


          ],
            )
         );
        }
       }
        class  _CustomAppbar extends StatelessWidget {

       final Movie movie;

      const _CustomAppbar(  this.movie);


          @override
          Widget build(BuildContext context) {
            return  SliverAppBar(
               backgroundColor: Colors.black,
               expandedHeight: 200,
              floating: false,
              pinned:true,
              flexibleSpace: FlexibleSpaceBar(

                centerTitle: true,
                titlePadding: const EdgeInsets.all(0),
                title: Container(
                width: double.infinity,
                alignment: Alignment.bottomCenter,
                padding: const EdgeInsets.only(bottom:10),
                color: Colors.black12,
                child:  Text(
                     movie.title,
                     style: const TextStyle(fontSize:16),
                             ),
               ),
                  background:  FadeInImage(
                  placeholder: AssetImage("assets/loading.gif"),
                  image: NetworkImage (movie.fullPosterImg),
                     fit:BoxFit.scaleDown,
                  ),
              )

            );
           }
          }

            class _PosterAndTitle extends StatelessWidget {
             
            final Movie movie;
            
        const _PosterAndTitle(this.movie);


             @override
              Widget build(BuildContext context) {

              final TextTheme textTheme = Theme.of(context).textTheme;

     return Container(
           margin:const EdgeInsets.only(top:20),
           padding:const EdgeInsets.symmetric(horizontal:20),
      child: Row(
           children: [
         ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child:  FadeInImage(
            placeholder: const AssetImage("assets/no-image.jpg"),
            image: NetworkImage (movie.fullPosterImg),
             height: 150,
           ),
         ),

             const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                  Text(movie.title,style:textTheme.headline5,overflow: TextOverflow.ellipsis,maxLines: 2,),
                  Text (movie.originalTitle,style:textTheme.subtitle1,overflow: TextOverflow.ellipsis,),
                  Row(
                  children:  [
                  const Icon (Icons.star_outline, size: 15, color:Colors.grey),
                  Text('${movie.voteAverage}', style:textTheme.caption),
                   ],
                   )
                   ],
                )
              ]
          ),
        );
      }
    }

class _OverView extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      padding: const EdgeInsets.symmetric(horizontal:30,vertical: 10 ),
      child: Text("Nullercitatiuis nostrud dolore nulla anim mollit esse amet. Commodo sit est consectetur incididunt laborum dolore culpa pariatur ex sunt labore. In fugiat consectetur ut nulla ut cillum exercitation est reprehenderit consectetur excepteur incididunt ad labore.",
      textAlign: TextAlign.justify,
      style: Theme.of(context).textTheme.subtitle1
      ),
   
 
    );
  }
}




