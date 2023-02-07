

import 'package:flutter/material.dart';
import 'package:flutter_app_films/Widgets/widgets.dart';

        class DetailsScreen extends StatelessWidget {
        const DetailsScreen({super.key});

  

         @override
         Widget build(BuildContext context) {

    
        return Scaffold(
      
           body: CustomScrollView(
           slivers: [
             _CustomAppbar(),
              SliverList(
               delegate: SliverChildListDelegate([
               _PosterAndTitle(),
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



          @override
          Widget build(BuildContext context) {
            return  SliverAppBar(
               backgroundColor: Colors.green,
               expandedHeight: 200,
              floating: false,
              pinned:true,
              flexibleSpace: FlexibleSpaceBar(

                centerTitle: true,
                titlePadding: const EdgeInsets.all(0),
                title: Container(
                width: double.infinity,
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.only(bottom:10),
                color: Colors.black12,
                child: const Text("movie.title",style: TextStyle(fontSize:16),
                             ),
               ),
                  background: const FadeInImage(
                  placeholder: AssetImage("assets/loading.gif"),
                  image: NetworkImage ("https://via.placeholder.com/500x300"),
                     fit:BoxFit.cover,
                  ),
              )

            );
           }
          }

            class _PosterAndTitle extends StatelessWidget {
             

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
            child: const FadeInImage(
            placeholder: AssetImage("assets/no-image.jpg"),
            image: NetworkImage ("https://via.placeholder.com/150x300"),
             height: 150,
           ),
         ),

             const SizedBox(width: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                  Text("movie.title",style:textTheme.headline5,overflow: TextOverflow.ellipsis,maxLines: 2,),
                  Text ("movie.originalTitle",style:textTheme.subtitle1,overflow: TextOverflow.ellipsis,),
                  Row(
                  children:  [
                  const Icon (Icons.star_outline, size: 15, color:Colors.grey),
                  Text("movie.voteAvarage", style:textTheme.caption),
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




