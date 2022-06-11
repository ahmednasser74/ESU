import 'package:boilerplate/core/usecases/usecase.dart';
import 'package:boilerplate/features/home/data/models/response/popular_question/popular_question_item_response_model.dart';
import 'package:dartz/dartz.dart';

import '../repositories/home_repository.dart';

class PopularQuestionUseCase extends UseCase<
    Future<Either<String?, PopularQuestionResponseModel>>, NoParams> {
  PopularQuestionUseCase({required this.repository});

  final HomeRepository repository;

  @override
  Future<Either<String?, PopularQuestionResponseModel>> call({
    required NoParams params,
  }) async =>
      await repository.getPopularQuestion();
}
