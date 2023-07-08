import 'package:dartz/dartz.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/movie/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movie/domain/entities/movie.dart';
import 'package:movies_app/movie/domain/repository/base_movie_repo.dart';

class MoviesRepo extends BaseMovieRepo {
  final BaseMovieRemoteDataSource baseMovieRemoteDataSource;

  MoviesRepo(this.baseMovieRemoteDataSource);
  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
    try {
      return result;
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorModel.statusMessages));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final result = await baseMovieRemoteDataSource.getPopularMovies();
    try {
      return result;
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorModel.statusMessages));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRatedMovies() async {
    final result = await baseMovieRemoteDataSource.getNowPlayingMovies();
    try {
      return result;
    } on ServerException catch (error) {
      return Left(ServerFailure(error.errorModel.statusMessages));
    }
  }
}
