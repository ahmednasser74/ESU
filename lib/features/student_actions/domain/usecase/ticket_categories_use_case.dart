import 'package:esu/core/usecases/usecase.dart';
import 'package:esu/features/student_actions/data/models/response/ticket_category/ticket_category_data_response_model.dart';
import 'package:esu/features/student_actions/domain/repository/student_actions_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable()

class TicketCategoriesUseCase extends UseCase<
    Future<Either<String?, TicketsCategoriesResponseModel>>, NoParams> {
  final StudentActionsRepository studentActionsRepository;

  TicketCategoriesUseCase({required this.studentActionsRepository});

  @override
  Future<Either<String?, TicketsCategoriesResponseModel>> call({
    required NoParams params,
  }) async =>
      studentActionsRepository.getCategories();
}
