import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movie/domain/usecases/get_now_playing_usecase.dart';
import 'package:movies_app/movie/domain/usecases/get_popular_movies_usecase.dart';
import 'package:movies_app/movie/domain/usecases/get_top_rated_movies_usecase.dart';
import 'package:movies_app/movie/presentation/controller/movies_events.dart';
import 'package:movies_app/movie/presentation/controller/movies_states.dart';

class MoviesBloc extends Bloc<MoviesEvents, MoviesStates> {
  final GetNowPlayingMoviesUseCase getNowPlayingMoviesUseCase;
  final GetTopRatedMoviesUsecase getTopRatedMoviesUsecase;
  final GetPopularMoviesUsecase getPopularMoviesUsecase;

  MoviesBloc(this.getNowPlayingMoviesUseCase, this.getTopRatedMoviesUsecase, this.getPopularMoviesUsecase) : super(const MoviesStates()) {
    on<GetNowPlayingMoviesEvent>(_getNowPlayingMovies);
    on<GetPopularMoviesEvent>(_getPopularMovies);
    on<GetTopRatedMoviesEvent>(_getTopRatedMovies);
  }

  FutureOr<void> _getNowPlayingMovies(GetNowPlayingMoviesEvent event, Emitter<MoviesStates> emit) async {
    /// callable class
    final result = await getNowPlayingMoviesUseCase(const NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
          nowPlayingState: RequestStates.error,
          nowPlayingMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          nowPlayingState: RequestStates.success,
          nowPlaying: r,
        ),
      ),
    );
  }

  FutureOr<void> _getPopularMovies(GetPopularMoviesEvent event, Emitter<MoviesStates> emit) async {
    /// callable class
    final result = await getTopRatedMoviesUsecase(const NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
          popularState: RequestStates.error,
          popularMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          popularState: RequestStates.success,
          popular: r,
        ),
      ),
    );
  }

  FutureOr<void> _getTopRatedMovies(GetTopRatedMoviesEvent event, Emitter<MoviesStates> emit) async {
    /// callable class
    final result = await getTopRatedMoviesUsecase(const NoParameters());
    result.fold(
      (l) => emit(
        state.copyWith(
          topRatedMessage: l.message,
          topRatedState: RequestStates.error,
        ),
      ),
      (r) => emit(
        state.copyWith(
          topRated: r,
          topRatedState: RequestStates.success,
        ),
      ),
    );
  }
}
