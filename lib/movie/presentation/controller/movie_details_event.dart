part of 'movie_details_bloc.dart';

abstract class MovieDetailsEvents extends Equatable {
  const MovieDetailsEvents();
}

class GetMovieDetailsEvent extends MovieDetailsEvents {
  final int id;

  const GetMovieDetailsEvent(this.id);

  @override
  List<Object> get props => [id];
}

class GetMovieRecommendationEvent extends MovieDetailsEvents {
  final int id;

  const GetMovieRecommendationEvent(this.id);

  @override
  List<Object> get props => [id];
}
