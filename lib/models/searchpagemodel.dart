import 'package:movies/models/movieModel.dart';
import 'package:movies/movieapi.dart';

class SearchPageModel {
  searchForMovie(String name) async {
    if (name == null) return null;
    var response = await MovieApi.getMovie(name);
    return MovieModel.fromJson(response);
  }
}
