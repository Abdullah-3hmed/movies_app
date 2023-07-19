import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movie/domain/entities/movie_details.dart';
import 'package:movies_app/movie/domain/entities/recommendation.dart';
import 'package:movies_app/movie/domain/usecases/get_movie_details_usecase.dart';
import 'package:movies_app/movie/domain/usecases/get_recommendation_usecase.dart';

part 'movie_details_event.dart';
part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvents, MovieDetailsStates> {
  MovieDetailsBloc(this.getMovieDetailsUseCase, this.getRecommendationUseCase) : super(const MovieDetailsStates()) {
    on<GetMovieDetailsEvent>(_getMovieDetails);
    on<GetMovieRecommendationEvent>(_getRecommendation);
  }

  final GetMovieDetailsUseCase getMovieDetailsUseCase;
  final GetRecommendationUseCase getRecommendationUseCase;

  FutureOr<void> _getMovieDetails(GetMovieDetailsEvent event, Emitter<MovieDetailsStates> emit) async {
    final result = await getMovieDetailsUseCase(MovieDetailsParameters(event.id));
    result.fold(
      (l) => emit(
        state.copyWith(
          movieDetailsState: RequestStates.error,
          movieDetailsMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          movieDetails: r,
          movieDetailsState: RequestStates.success,
        ),
      ),
    );
  }

  FutureOr<void> _getRecommendation(GetMovieRecommendationEvent event, Emitter<MovieDetailsStates> emit) async {
    final result = await getRecommendationUseCase(RecommendationParameters(event.id));
    result.fold(
      (l) => emit(
        state.copyWith(
          recommendationState: RequestStates.error,
          recommendationMessage: l.message,
        ),
      ),
      (r) => emit(
        state.copyWith(
          recommendation: r,
          recommendationState: RequestStates.success,
        ),
      ),
    );
  }
}
