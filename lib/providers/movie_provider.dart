import 'package:flutter/material.dart';
import 'package:movie_app/models/movie.dart';
import 'package:movie_app/utils/movie_parser.dart';


class MovieProvider extends ChangeNotifier{
    List <Movie> _movieList=[
  ];
  
  List <Movie> get movieList => _movieList;
  
 // List<Movie> get movie => null; 

  Future  <void> loadMovies(BuildContext context) async{
    try{
      final jsonString=
      await DefaultAssetBundle.of(context) 
      .loadString ('assets/data/films.json');
      final movies = MovieParser.parse(jsonString);
      _movieList = movies;
      notifyListeners();
    }
    catch (e){
    //  print ("ERROR! $e");
    }
  }


  // List <String> loadMovies(){
  //   _movieList.add("new movie added");
  //   notifyListeners();
  //   return _movieList;
  // }
 
}