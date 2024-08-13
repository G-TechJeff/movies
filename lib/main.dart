import 'package:flutter/material.dart';
import'package:movie_app/providers/movie_provider.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(ChangeNotifierProvider(
    create:( context)=>MovieProvider(),
    child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: 'Movie Shop',
      theme: ThemeData(
        //colorScheme: ColorScheme.fromSeed(seedColor: Color.fromARGB(255, 209, 69, 214)),
        useMaterial3: true,
      ),
      home: const Home(),
    );
  }
}
class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    Provider.of<MovieProvider>(context, listen: false)
    .loadMovies(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    
    final movieData= Provider.of<MovieProvider>(context);
        return Scaffold(
      appBar: AppBar(
        // iconTheme: IconThemeDat,
        // leading: CircleAvatar(child: Text),
        title: const Text("Netflix",
        selectionColor: Color.fromARGB(95, 12, 230, 96),
        style: TextStyle(
          fontWeight: FontWeight.bold,
        ),
        ),
        backgroundColor: const Color.fromARGB(255, 230, 8, 130),
        
      ),
      //add body
    body: Center(
      child: ListView.builder(
        //itemCount:2,
      itemCount: movieData.movieList.length,
      itemBuilder: (context,index){
        final movie = movieData.movieList[index];
        return Card(
          child: ExpansionTile(title: Text(movie.title),
          subtitle: Text("Director ${movie.director}"),
          leading: CircleAvatar (child: Text(movie.title[0])),
          children: [
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.only(left:80),
              child:  Column(
                children: [
                  RichText(text: TextSpan(
                    style: DefaultTextStyle.of(context).style,
                    children: const [
                      TextSpan(text: "Released: "
                      ),
                      TextSpan(text: " thr year :"
                      ),
                    ]
                  ))
                ],
              ),
            )
            ],
          ),
        );
      //  return ListTile( 
      //   iconColor: Color.fromARGB(255, 171, 218, 5),
      //   title: Text(movie.title),
      //   subtitle: const Text("Trending movies"),
      //    trailing: const Icon(
      //       Icons.sunny_snowing,
      //       color: Color.fromARGB(255, 224, 66, 4),
      //     ),
      //     leading: CircleAvatar(
      //       child: Text(movie.time),
      //     ),
      //   );
      }
        ),
        )
    );
    
  }
}


