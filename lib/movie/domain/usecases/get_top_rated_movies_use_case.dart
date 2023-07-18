import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movie/domain/entities/movie.dart';
import 'package:movies_app/movie/domain/repository/base_movie_repo.dart';

class GetTopRatedMoviesUsecase {
  final BaseMovieRepo baseMovieRepo;

  GetTopRatedMoviesUsecase(this.baseMovieRepo);
  Future<Either<Failure, List<Movie>>> execute() async {
    return await baseMovieRepo.getTopRatedMovies();
  }
}