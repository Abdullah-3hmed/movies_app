import 'package:get_it/get_it.dart';
import 'package:movies_app/movie/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movie/data/repository/movies_repo.dart';
import 'package:movies_app/movie/domain/repository/base_movie_repo.dart';
import 'package:movies_app/movie/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/movie/domain/usecases/get_now_playing_usecase.dart';
import 'package:movies_app/movie/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_app/movie/domain/usecases/get_recommendation_usecase.dart';
import 'package:movies_app/movie/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies_app/movie/presentation/controller/movie_details_bloc.dart';
import 'package:movies_app/movie/presentation/controller/movies_bloc.dart';

// dependency injection
final GetIt getIt = GetIt.instance;

class ServicesLocator {
  void init() {
    /// bloc
    getIt.registerFactory<MoviesBloc>(() => MoviesBloc(getIt(), getIt(), getIt()));
    getIt.registerFactory<MovieDetailsBloc>(() => MovieDetailsBloc(getIt(), getIt()));

    /// usecase
    getIt.registerLazySingleton<GetNowPlayingMoviesUseCase>(() => GetNowPlayingMoviesUseCase(getIt()));
    getIt.registerLazySingleton<GetPopularMoviesUsecase>(() => GetPopularMoviesUsecase(getIt()));
    getIt.registerLazySingleton<GetTopRatedMoviesUsecase>(() => GetTopRatedMoviesUsecase(getIt()));
    getIt.registerLazySingleton<GetMovieDetailsUseCase>(() => GetMovieDetailsUseCase(getIt()));
    getIt.registerLazySingleton<GetRecommendationUseCase>(() => GetRecommendationUseCase(getIt()));

    /// repo
    getIt.registerLazySingleton<BaseMovieRepo>(() => MoviesRepo(getIt()));

    /// data source
    getIt.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());
  }
}
