import 'package:boilerplate/features/student_actions/data/models/request/ticket_details/ticket_details_request_model.dart';
import 'package:boilerplate/features/student_actions/data/models/response/ticket_details/tickets_details_response_model.dart';
import 'package:boilerplate/features/student_actions/domain/usecase/ticket_details_single_use_case.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TicketDetailsController extends GetxController
    with StateMixin<TicketDetailsResponseModel> {
  final TicketDetailsUseCase ticketDetailsUseCase;

  TicketDetailsController({required this.ticketDetailsUseCase});

  late int ticketId;

  @override
  onInit() {
    super.onInit();
    ticketId = Get.arguments as int;
    _getTicketDetails(ticketId: ticketId);
  }

  void _getTicketDetails({required int ticketId}) async {
    final response = await ticketDetailsUseCase(
      params: TicketDetailsRequestModel(ticketId: ticketId),
    );
    response.fold(
      (l) => change(null, status: RxStatus.error(l)),
      (r) {
        if (r.status) {
          if (r.data!.replies.isEmpty) {
            change(null, status: RxStatus.empty());
          } else {
            change(r, status: RxStatus.success());
          }
        } else {
          change(null, status: RxStatus.error(r.message));
        }
      },
    );
  }
}
