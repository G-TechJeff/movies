class Movie{
  final String title;
  final String year;
  final String director;
  final String actors;
  final String country;
  final String time;
  final String seasons;
  final String episodes;
  final List <String> images;

  Movie({
    required this.title,
    required this.year,
    required this.director,
    required this.actors,
    required this.country,
    required this.time,
    required this.seasons,
    required this.episodes,
    required this.images,
  });

  factory Movie.fromJson(Map<String, dynamic> json){
    return Movie(
      title: json['Title'] as String,
      year: json['year'] as String,
      director: json['Director'] as String,
      actors: json['Actors'] as String,
      country: json['Country'] as String,
      time: json['Time'] as String,
      seasons: json['Season'] as String,
      episodes: json['Episodes'] as String,
      images: List<String>.from(json["Images"]as List),
    );
  }
}