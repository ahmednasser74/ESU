import 'package:boilerplate/features/student_actions/domain/usecase/ticket_create_use_case.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TicketCreateController extends GetxController {
  final TicketCreateUseCase ticketCreateUseCase;

  TicketCreateController({required this.ticketCreateUseCase});
}
