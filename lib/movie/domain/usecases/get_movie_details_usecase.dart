import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movie/domain/entities/movie_details.dart';
import 'package:movies_app/movie/domain/repository/base_movie_repo.dart';

class GetMovieDetailsUseCase extends BaseUseCase<MovieDetails, MovieDetailsParameters> {
  final BaseMovieRepo baseMovieRepo;

  GetMovieDetailsUseCase(this.baseMovieRepo);

  @override
  Future<Either<Failure, MovieDetails>> call(MovieDetailsParameters parameters) async {
    return await baseMovieRepo.getMovieDetails(parameters);
  }
}

class MovieDetailsParameters extends Equatable {
  final int movieId;

  const MovieDetailsParameters(this.movieId);

  @override
  List<Object> get props => [movieId];
}
