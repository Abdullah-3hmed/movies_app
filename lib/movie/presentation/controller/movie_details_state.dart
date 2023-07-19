part of 'movie_details_bloc.dart';

class MovieDetailsStates extends Equatable {
  final MovieDetails? movieDetails;
  final RequestStates movieDetailsState;
  final String movieDetailsMessage;
  final List<Recommendation> recommendation;
  final RequestStates recommendationState;
  final String recommendationMessage;

  const MovieDetailsStates({
    this.movieDetails,
    this.movieDetailsState = RequestStates.loading,
    this.movieDetailsMessage = '',
    this.recommendation = const [],
    this.recommendationMessage = '',
    this.recommendationState = RequestStates.loading,
  });

  MovieDetailsStates copyWith({
    MovieDetails? movieDetails,
    RequestStates? movieDetailsState,
    String? movieDetailsMessage,
    List<Recommendation>? recommendation,
    RequestStates? recommendationState,
    String? recommendationMessage,
  }) {
    return MovieDetailsStates(
      movieDetailsMessage: movieDetailsMessage ?? this.movieDetailsMessage,
      movieDetails: movieDetails ?? this.movieDetails,
      movieDetailsState: movieDetailsState ?? this.movieDetailsState,
      recommendation: recommendation ?? this.recommendation,
      recommendationState: recommendationState ?? this.recommendationState,
      recommendationMessage: recommendationMessage ?? this.recommendationMessage,
    );
  }

  @override
  List<Object?> get props => [
        movieDetails,
        movieDetailsState,
        movieDetailsMessage,
        recommendation,
        recommendationState,
        recommendationMessage,
      ];
}
