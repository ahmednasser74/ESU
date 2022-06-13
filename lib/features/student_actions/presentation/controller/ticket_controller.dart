import 'package:boilerplate/core/usecases/usecase.dart';
import 'package:boilerplate/features/student_actions/data/models/response/tickets/tickets_response_model.dart';
import 'package:boilerplate/features/student_actions/domain/usecase/tickets_use_case.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class TicketsController extends GetxController
    with StateMixin<TicketsResponseModel> {
  final TicketsUseCase ticketsUseCase;

  TicketsController({required this.ticketsUseCase});

  @override
  void onInit() {
    super.onInit();
    getTickets();
  }

  void getTickets() async {
    change(null, status: RxStatus.loading());
    final finance = await ticketsUseCase(params: NoParams());
    finance.fold(
      (l) => change(null, status: RxStatus.error(l)),
      (r) {
        if (r.status == true) {
          if (r.data.isEmpty) {
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
