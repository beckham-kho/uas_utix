import 'dart:convert';
import 'package:uas_utix/models/movie_genre.dart';
import 'package:uas_utix/models/movies_model.dart';
import 'package:uas_utix/api_constants.dart';
import 'package:http/http.dart' as http;


class Api {
  static const _nowPlayingMovieUrl = 'https://api.themoviedb.org/3/movie/now_playing?api_key=${ApiConstants.apiKey}';
  static const _movieGenreUrl = 'https://api.themoviedb.org/3/genre/movie/list?api_key=${ApiConstants.apiKey}';

  Future<List<MovieModel>> getNowPlayingMovies() async {
    final response = await http.get(Uri.parse(_nowPlayingMovieUrl));
    if(response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => MovieModel.fromJson(movie)).toList();
    } else {
      throw Exception('Something wrong, please refresh the page');
    }
  }

  Future<List<MovieGenre>> getMovieGenre() async {
    final response = await http.get(Uri.parse(_movieGenreUrl));
    if(response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => MovieGenre.fromJson(movie)).toList();
    } else {
      throw Exception('Something wrong, please refresh the page');
    }
  }
}