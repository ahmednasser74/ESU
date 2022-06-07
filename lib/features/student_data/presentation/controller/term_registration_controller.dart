import 'package:boilerplate/core/usecases/usecase.dart';
import 'package:boilerplate/features/student_data/data/models/response/availability_term_registration/availability_term_registration_response_model.dart';
import 'package:boilerplate/features/student_data/domain/usecase/availability_term_registration_use_case.dart';
import 'package:get/get.dart';

class TermRegistrationController extends GetxController
    with StateMixin<AvailabilityTermRegistrationResponseModel> {
  TermRegistrationController({
    required this.availabilityTermRegistrationUseCase,
  });

  final AvailabilityTermRegistrationUseCase availabilityTermRegistrationUseCase;

  @override
  void onInit() {
    super.onInit();
    getAvailabilityTermRegistration();
  }

  void getAvailabilityTermRegistration() async {
    change(null, status: RxStatus.loading());
    final finance = await availabilityTermRegistrationUseCase(
      params: NoParams(),
    );
    finance.fold(
      (l) => change(null, status: RxStatus.error(l)),
      (r) {
        if (r.status == true) {
          change(r, status: RxStatus.success());
        } else {
          change(null, status: RxStatus.error(r.message));
        }
      },
    );
  }
}
