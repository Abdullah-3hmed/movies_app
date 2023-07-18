import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_useCase.dart';
import 'package:movies_app/movie/domain/entities/movie.dart';
import 'package:movies_app/movie/domain/repository/base_movie_repo.dart';

class GetPopularMoviesUsecase extends BaseUseCase<List<Movie>> {
  final BaseMovieRepo baseMovieRepo;

  GetPopularMoviesUsecase(this.baseMovieRepo);

  @override
  Future<Either<Failure, List<Movie>>> call() async {
    return await baseMovieRepo.getPopularMovies();
  }
}
