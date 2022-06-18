import 'package:esu/core/usecases/usecase.dart';
import 'package:esu/features/student_actions/data/models/request/ticket_reply/ticket_reply_request_model.dart';
import 'package:esu/features/student_actions/data/models/response/ticket_details/tickets_details_response_model.dart';
import 'package:esu/features/student_actions/domain/repository/student_actions_repository.dart';
import 'package:dartz/dartz.dart';

class TicketReplyUseCase extends UseCase<
    Future<Either<String?, TicketDetailsResponseModel>>,
    TicketReplyRequestModel> {
  final StudentActionsRepository studentActionsRepository;

  TicketReplyUseCase({required this.studentActionsRepository});

  @override
  Future<Either<String?, TicketDetailsResponseModel>> call({
    required TicketReplyRequestModel params,
  }) async =>
      studentActionsRepository.ticketReply(requestModel: params);
}
