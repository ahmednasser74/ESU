import 'package:esu/core/usecases/usecase.dart';
import 'package:esu/features/student_actions/data/models/response/tickets/tickets_response_model.dart';
import 'package:esu/features/student_actions/domain/repository/student_actions_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

@Injectable()

class TicketsUseCase
    extends UseCase<Future<Either<String?, TicketsResponseModel>>, NoParams> {
  final StudentActionsRepository studentActionsRepository;

  TicketsUseCase({required this.studentActionsRepository});

  @override
  Future<Either<String?, TicketsResponseModel>> call({
    required NoParams params,
  }) async =>
      studentActionsRepository.getTickets();
}
