import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movies_app/core/error/failure.dart';
import 'package:movies_app/core/usecase/base_usecase.dart';
import 'package:movies_app/movie/domain/entities/recommendation.dart';
import 'package:movies_app/movie/domain/repository/base_movie_repo.dart';

class GetRecommendationUseCase extends BaseUseCase<List<Recommendation>, RecommendationParameters> {
  final BaseMovieRepo baseMovieRepo;

  GetRecommendationUseCase(this.baseMovieRepo);
  @override
  Future<Either<Failure, List<Recommendation>>> call(RecommendationParameters parameters) async {
    return await baseMovieRepo.getRecommendations(parameters);
  }
}

class RecommendationParameters extends Equatable {
  final int id;

  const RecommendationParameters(this.id);

  @override
  List<Object> get props => [id];
}
