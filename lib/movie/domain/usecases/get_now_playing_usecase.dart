import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movie/domain/entities/movie.dart';
import 'package:movies_app/movie/domain/repository/base_movie_repo.dart';

class GetNowPlayingMoviesUseCase extends BaseUseCase<List<Movie>, NoParameters> {
  final BaseMovieRepo baseMovieRepo;

  GetNowPlayingMoviesUseCase(this.baseMovieRepo);

  @override
  Future<Either<Failure, List<Movie>>> call(NoParameters parameters) async {
    return await baseMovieRepo.getNowPlayingMovies();
  }
}
