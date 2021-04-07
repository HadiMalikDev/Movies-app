import 'package:flutter/material.dart';
import 'package:movies/models/movieModel.dart';

class MoviePage extends StatelessWidget {
  MovieModel movie;
  MoviePage({this.movie});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xFF26272c),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.transparent,
              title: Text('${movie.title}',style: TextStyle(color: Colors.white,fontSize: 20),),
              stretch: true,
              centerTitle: true,
              expandedHeight: size.height * 0.6,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  "${movie.poster}",
                  fit: BoxFit.fill,
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  getColumn(title: 'Plot:', text: "${movie.plot}"),
                  SizedBox(
                    height: 20,
                  ),
                  getColumn(title: 'People involved',text: ''),
                  getRow(title: 'Director:', text: "${movie.director}"),
                  getRow(title: 'Writer(s):', text: "${movie.writer}"),
                  getRow(title: 'Actor(s):', text: "${movie.actors}"),
                  getColumn(title: 'Details',text: ''),
                  getRow(title: 'Year:', text: "${movie.year}"),
                  getRow(title: 'Genre:', text: "${movie.genre}"),
                  getRow(title: 'Rated:', text: "${movie.rated}"),
                  getRow(title: 'Language(s):', text: "${movie.language}"),
                  getRow(title: 'Country:', text: "${movie.country}"),
                  getRow(title: 'Award(s):', text: "${movie.awards}"),
                  getColumn(title: 'Ratings',text: ''),
                  for (var item in movie.ratings)
                    getRow(
                      title: '${item['Source']}',
                      text: '${item['Value']}',
                    )
                  ,
                  getRow(title: 'Metascore:', text: "${movie.metaScore}"),
                  getRow(title: 'IMDB Rating:', text: "${movie.imdbRating}"),
                  
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  getColumn({String title, String text}) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            "$title",textAlign: TextAlign.center,
            style: TextStyle(color: Colors.amber, fontSize: 20),
          ),
          Text(
            "$text",
            style: TextStyle(color: Color(0xFFa4a5a9), fontSize: 18),
          )
        ],
      ),
    );
  }

  getRow({String title, String text}) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              child: Text(
                "$title",
                style: TextStyle(color: Colors.grey, fontSize: 20),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              child: Text(
                "${text.split(",").join("\n")}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
                textAlign: TextAlign.right,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
