import 'package:flutter/material.dart';
import 'package:instamovie/models/movie_response.dart';

class MovieTile extends StatelessWidget {
  final MovieResponse movie;
  const MovieTile(this.movie);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        MovieHeader(movie),
        MovieImage(movie),
        MovieActions(movie),
        MovieLikes(movie),
        MovieDescription(movie),
      ],
    );
  }
}

class MovieDescription extends StatelessWidget {
  final MovieResponse movie;

  const MovieDescription(this.movie);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Text(
        movie.overview,
        style: TextStyle(color: Colors.grey),
      ),
    );
  }
}

class MovieLikes extends StatelessWidget {
  final MovieResponse movie;

  MovieLikes(this.movie);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Row(
        children: <Widget>[
          Text('Curtido por '),
          Text(
            '${movie.voteCount} pessoas',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class MovieActions extends StatelessWidget {
  final MovieResponse movie;

  const MovieActions(this.movie);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        IconButton(
          icon: Icon(Icons.favorite_border),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.chat_bubble_outline),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.send),
          onPressed: () {},
        ),
        Spacer(),
        Icon(Icons.star, color: Colors.yellow),
        Text(
          movie.voteAverage.toString(),
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        SizedBox(width: 10),
      ],
    );
  }
}

class MovieHeader extends StatelessWidget {
  final MovieResponse movie;
  MovieHeader(this.movie);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(width: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              movie.title,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
            Text(
              movie.originalTitle,
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ),
        Spacer(),
        IconButton(
          icon: Icon(Icons.more_vert),
          onPressed: () {},
        ),
      ],
    );
  }
}

class MovieImage extends StatelessWidget {
  final MovieResponse movie;

  MovieImage(this.movie);

  @override
  Widget build(BuildContext context) {
    if (movie.posterPath == null) {
      return Container(
        color: Colors.grey[200],
        height: 300,
        child: Center(
          child: Icon(Icons.photo, size: 64, color: Colors.grey),
        ),
      );
    }

    return Image.network(
      'https://image.tmdb.org/t/p/w500${movie.posterPath}',
      height: 300,
      width: double.infinity,
      fit: BoxFit.cover,
    );
  }
}
