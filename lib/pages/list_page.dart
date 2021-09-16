import 'package:flutter/material.dart';
import 'package:instamovie/models/movie_response.dart';
import 'package:instamovie/services/movie_service.dart';
import 'package:instamovie/widgets/movie_tile.dart';

class ListPage extends StatefulWidget {
  final String query;

  ListPage(this.query);

  @override
  _ListPageState createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  Future<List<MovieResponse>> moviesSearch;

  fsadfsda

  @override
  void initState() {
    super.initState();
    moviesSearch = MovieService.search(widget.query);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        title: Image.asset("assets/logo.png"),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      ),
      body: FutureBuilder<List<MovieResponse>>(
        future: moviesSearch,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Icon(
                    Icons.error_outline,
                    size: 96,
                    color: Colors.red,
                  ),
                  SizedBox(height: 10),
                  Text(
                    "Ocorreu um erro na pesquisa",
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(height: 10),
                  Text(
                    snapshot.error.toString(),
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[400],
                    ),
                  ),
                  FlatButton(
                    child: Text("Tentar novamente"),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            );
          }

          var movies = snapshot.data;
          return ListView.builder(
            itemCount: movies.length,
            itemBuilder: (_, i) => MovieTile(movies[i]),
          );
        },
      ),
    );
  }
}

class ErrorMessage extends StatelessWidget {
  final dynamic error;

  ErrorMessage(this.error);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
