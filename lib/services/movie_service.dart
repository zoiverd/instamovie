import 'package:dio/dio.dart';
import 'package:instamovie/models/movie_response.dart';

class MovieService {
  static Future<List<MovieResponse>> search(String query) async {
    var res = await Dio().get(
      "https://api.themoviedb.org/3/search/movie",
      queryParameters: {
        'api_key': 'd1c5594bf0df2200ee50381cc854b8ff',
        'language': 'pt-BR',
        'page': 1,
        'include_adult': false,
        'query': query
      },
    );
    return PagedResponse.fromJson(res.data).results;
  }
}
