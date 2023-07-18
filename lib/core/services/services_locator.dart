import 'package:get_it/get_it.dart';
import 'package:movies_app/movie/data/datasource/movie_remote_data_source.dart';
import 'package:movies_app/movie/data/repository/movies_repo.dart';
import 'package:movies_app/movie/domain/repository/base_movie_repo.dart';
import 'package:movies_app/movie/domain/usecases/get_now_playing_use_case.dart';
import 'package:movies_app/movie/domain/usecases/get_popular_movies_use_case.dart';
import 'package:movies_app/movie/domain/usecases/get_top_rated_movies_use_case.dart';
import 'package:movies_app/movie/presentation/controller/movies_bloc.dart';

// dependency injection
final GetIt getIt = GetIt.instance;

class ServicesLocator {
  void init() {
    /// bloc
    getIt.registerFactory<MoviesBloc>(() => MoviesBloc(getIt(), getIt(), getIt()));

    /// usecase
    getIt.registerLazySingleton<GetNowPlayingMoviesUseCase>(() => GetNowPlayingMoviesUseCase(getIt()));
    getIt.registerLazySingleton<GetPopularMoviesUsecase>(() => GetPopularMoviesUsecase(getIt()));
    getIt.registerLazySingleton<GetTopRatedMoviesUsecase>(() => GetTopRatedMoviesUsecase(getIt()));

    /// repo
    getIt.registerLazySingleton<BaseMovieRepo>(() => MoviesRepo(getIt()));

    /// data source
    getIt.registerLazySingleton<BaseMovieRemoteDataSource>(() => MovieRemoteDataSource());
  }
}
