import 'package:esu/core/usecases/usecase.dart';
import 'package:esu/features/student_actions/data/models/request/ticket_create/ticket_create_request_model.dart';
import 'package:esu/features/student_actions/data/models/response/ticket_details/tickets_details_response_model.dart';
import 'package:esu/features/student_actions/domain/repository/student_actions_repository.dart';
import 'package:dartz/dartz.dart';

class TicketCreateUseCase extends UseCase<
    Future<Either<String?, TicketDetailsResponseModel>>,
    TicketCreateRequestModel> {
  final StudentActionsRepository studentActionsRepository;

  TicketCreateUseCase({required this.studentActionsRepository});

  @override
  Future<Either<String?, TicketDetailsResponseModel>> call({
    required TicketCreateRequestModel params,
  }) async =>
      studentActionsRepository.createTicket(requestModel: params);
}
