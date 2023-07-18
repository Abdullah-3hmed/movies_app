import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movie/domain/entities/movie.dart';
import 'package:movies_app/movie/domain/repository/base_movie_repo.dart';

class GetNowPlayingMoviesUseCase {
  final BaseMovieRepo baseMovieRepo;

  GetNowPlayingMoviesUseCase(this.baseMovieRepo);
  Future<Either<Failure, List<Movie>>> execute() async {
    return await baseMovieRepo.getNowPlayingMovies();
  }
}