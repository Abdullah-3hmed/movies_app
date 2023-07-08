import 'package:movies_app/movie/domain/entities/movie.dart';

// contract
abstract class BaseMovieRepo {
  Future<List<Movie>> getNowPlaying();
  Future<List<Movie>> getPopularMovies();
  Future<List<Movie>> getTopRatedMovies();
}
