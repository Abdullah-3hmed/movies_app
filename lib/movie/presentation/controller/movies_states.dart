import 'package:equatable/equatable.dart';
import 'package:movies_app/core/utils/enums.dart';
import 'package:movies_app/movie/domain/entities/movie.dart';

class MoviesStates extends Equatable {
  final List<Movie> nowPlaying;
  final RequestStates nowPlayingState;
  final String nowPlayingMessage;
  final List<Movie> popular;
  final RequestStates popularState;
  final String popularMessage;
  final List<Movie> topRated;
  final RequestStates topRatedState;
  final String topRatedMessage;

  const MoviesStates({
    this.nowPlaying = const [],
    this.nowPlayingState = RequestStates.loading,
    this.nowPlayingMessage = '',
    this.popular = const [],
    this.popularState = RequestStates.loading,
    this.popularMessage = '',
    this.topRated = const [],
    this.topRatedMessage = '',
    this.topRatedState = RequestStates.loading,
  });

  /// return old data and add new data
  /// not to remove old data
  MoviesStates copyWith({
    List<Movie>? nowPlaying,
    RequestStates? nowPlayingState,
    String? nowPlayingMessage,
    List<Movie>? popular,
    RequestStates? popularState,
    String? popularMessage,
    List<Movie>? topRated,
    RequestStates? topRatedState,
    String? topRatedMessage,
  }) {
    return MoviesStates(
      nowPlayingMessage: nowPlayingMessage ?? this.nowPlayingMessage,
      nowPlayingState: nowPlayingState ?? this.nowPlayingState,
      nowPlaying: nowPlaying ?? this.nowPlaying,
      popular: popular ?? this.popular,
      popularMessage: popularMessage ?? this.popularMessage,
      popularState: popularState ?? this.popularState,
      topRated: topRated ?? this.topRated,
      topRatedMessage: topRatedMessage ?? this.topRatedMessage,
      topRatedState: topRatedState ?? this.topRatedState,
    );
  }

  @override
  List<Object> get props => [
        nowPlaying,
        nowPlayingState,
        nowPlayingMessage,
        popular,
        popularState,
        popularMessage,
        topRated,
        topRatedState,
        topRatedMessage,
      ];
}
