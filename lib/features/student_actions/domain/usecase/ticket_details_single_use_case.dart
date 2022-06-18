import 'package:esu/core/usecases/usecase.dart';
import 'package:esu/features/student_actions/data/models/request/ticket_details/ticket_details_request_model.dart';
import 'package:esu/features/student_actions/data/models/response/ticket_details/tickets_details_response_model.dart';
import 'package:esu/features/student_actions/domain/repository/student_actions_repository.dart';
import 'package:dartz/dartz.dart';

class TicketDetailsUseCase extends UseCase<
    Future<Either<String?, TicketDetailsResponseModel>>,
    TicketDetailsRequestModel> {
  final StudentActionsRepository studentActionsRepository;

  TicketDetailsUseCase({required this.studentActionsRepository});

  @override
  Future<Either<String?, TicketDetailsResponseModel>> call({
    required TicketDetailsRequestModel params,
  }) async =>
      studentActionsRepository.getTicketDetails(requestModel: params);
}
