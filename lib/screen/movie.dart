import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/movie_provider.dart';


class moviespage extends StatelessWidget{
  static const routeName= '/movies';

  @override
  Widget build(BuildContext context) {
    final _movie_provider=Provider.of<movie_provider>(context,listen:false);
    final token=_movie_provider.movies;
    return Scaffold(
      appBar: AppBar(title: Text("movies"),),
      body: FutureBuilder(future: Provider.of(context,listen: false).fetch_movie(token),
          builder: (context,snapshot){
        if(snapshot.connectionState==ConnectionState.waiting){
          return Center(child: CircularProgressIndicator());
        }else if (snapshot.error !=null){
          return Center(child: Text('No movies'),);
        }else{
          return Consumer<movie_provider>(builder:
          (context,movie_provider,child )=>ListView.builder(
            itemCount: movie_provider.movies.length,
            itemBuilder: (context,index){
              final movies=movie_provider.movies[index];
              return ListTile(
                title: Text(movies.category),
                subtitle: Text('category:${movies.category}\nlanguages:${movies.language}\nsort: ${movies.sort}\ngenre:${movies.genre}'),
              );
            },
          ),);
        }
          }),
    );
  }
}