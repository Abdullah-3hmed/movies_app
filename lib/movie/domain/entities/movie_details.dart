import 'package:equatable/equatable.dart';
import 'package:movies_app/movie/domain/entities/geners.dart';

class MovieDetails extends Equatable {
  final int id;
  final String backdropPath;
  final String overview;
  final List<Genres> genres;
  final String releaseDate;
  final int runtime;
  final String title;
  final num voteAverage;

  const MovieDetails({
    required this.id,
    required this.backdropPath,
    required this.genres,
    required this.overview,
    required this.releaseDate,
    required this.runtime,
    required this.title,
    required this.voteAverage,
  });

  @override
  List<Object> get props => [
        id,
        backdropPath,
        overview,
        releaseDate,
        genres,
        runtime,
        title,
        voteAverage,
      ];
}
