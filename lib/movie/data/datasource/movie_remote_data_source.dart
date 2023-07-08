import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movies_app/core/error/api_constants.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/network/error_model.dart';
import 'package:movies_app/movie/data/models/movie_model.dart';
import 'package:movies_app/movie/domain/entities/movie.dart';

abstract class BaseMovieRemoteDataSource {
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies();
  Future<Either<Failure, List<Movie>>> getPopularMovies();
  Future<Either<Failure, List<Movie>>> getRatedMovies();
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<Either<Failure, List<Movie>>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstants.nowPlayingMoviesPath);
    if (response.statusCode == 200) {
      return Right(
        List<MovieModel>.from(
          (response.data["results"] as List).map(
            (e) => MovieModel.fromJson(e),
          ),
        ),
      );
    } else {
      throw ServerException(
        errorModel: ErrorModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopularMovies() async {
    final response = await Dio().get(ApiConstants.popularMoviesPath);
    if (response.statusCode == 200) {
      return Right(List<MovieModel>.from(
        (response.data["results"] as List).map(
          (e) => MovieModel.fromJson(e),
        ),
      ));
    } else {
      throw ServerException(
        errorModel: ErrorModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getRatedMovies() async {
    final response = await Dio().get(ApiConstants.topRatedPath);
    if (response.statusCode == 200) {
      return Right(List<MovieModel>.from(
        (response.data["results"] as List).map(
          (e) => MovieModel.fromJson(e),
        ),
      ));
    } else {
      throw ServerException(
        errorModel: ErrorModel.fromJson(response.data),
      );
    }
  }
}
