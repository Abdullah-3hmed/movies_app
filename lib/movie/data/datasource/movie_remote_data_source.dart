import 'package:dio/dio.dart';
import 'package:movies_app/core/error/exceptions.dart';
import 'package:movies_app/core/network/api_constants.dart';
import 'package:movies_app/core/network/error_model.dart';
import 'package:movies_app/movie/data/models/movie_detail_model.dart';
import 'package:movies_app/movie/data/models/movie_model.dart';
import 'package:movies_app/movie/data/models/recommendation_model.dart';
import 'package:movies_app/movie/domain/entities/movie.dart';
import 'package:movies_app/movie/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/movie/domain/usecases/get_recommendation_usecase.dart';

abstract class BaseMovieRemoteDataSource {
  Future<List<Movie>> getNowPlayingMovies();

  Future<List<Movie>> getPopularMovies();

  Future<List<Movie>> getRatedMovies();

  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters);

  Future<List<RecommendationModel>> getRecommendations(RecommendationParameters parameters);
}

class MovieRemoteDataSource extends BaseMovieRemoteDataSource {
  @override
  Future<List<Movie>> getNowPlayingMovies() async {
    final response = await Dio().get(ApiConstants.nowPlayingMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data["results"] as List).map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorModel: ErrorModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<Movie>> getPopularMovies() async {
    final response = await Dio().get(ApiConstants.popularMoviesPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data["results"] as List).map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorModel: ErrorModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<Movie>> getRatedMovies() async {
    final response = await Dio().get(ApiConstants.topRatedPath);
    if (response.statusCode == 200) {
      return List<MovieModel>.from(
        (response.data["results"] as List).map(
          (e) => MovieModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorModel: ErrorModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(MovieDetailsParameters parameters) async {
    final response = await Dio().get(ApiConstants.movieDetailsPath(parameters.movieId));
    if (response.statusCode == 200) {
      return MovieDetailsModel.fromJson(response.data);
    } else {
      throw ServerException(
        errorModel: ErrorModel.fromJson(response.data),
      );
    }
  }

  @override
  Future<List<RecommendationModel>> getRecommendations(RecommendationParameters parameters) async {
    final response = await Dio().get(ApiConstants.recommendationPath(parameters.id));
    if (response.statusCode == 200) {
      return List<RecommendationModel>.from(
        (response.data["results"] as List).map(
          (e) => RecommendationModel.fromJson(e),
        ),
      );
    } else {
      throw ServerException(
        errorModel: ErrorModel.fromJson(response.data),
      );
    }
  }
}
