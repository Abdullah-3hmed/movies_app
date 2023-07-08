import 'package:movies_app/movie/domain/entities/movie.dart';
import 'package:movies_app/movie/domain/repository/base_movie_repo.dart';

class GetPopularMovies {
  final BaseMovieRepo baseMovieRepo;

  GetPopularMovies(this.baseMovieRepo);
  Future<List<Movie>> execute() async {
    return await baseMovieRepo.getPopularMovies();
  }
}
