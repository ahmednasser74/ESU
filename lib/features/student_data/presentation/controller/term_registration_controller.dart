import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/screen/payment_web_view_screen.dart';
import 'package:boilerplate/core/usecases/usecase.dart';
import 'package:boilerplate/core/utils/helper_methods.dart';
import 'package:boilerplate/features/student_data/data/models/response/availability_term_registration/availability_term_registration_response_model.dart';
import 'package:boilerplate/features/student_data/domain/usecase/availability_term_registration_use_case.dart';
import 'package:boilerplate/features/student_data/domain/usecase/term_register_pay_use_case.dart';
import 'package:get/get.dart';

class TermRegistrationController extends GetxController
    with StateMixin<AvailabilityTermRegistrationResponseModel> {
  TermRegistrationController({
    required this.availabilityTermRegistrationUseCase,
    required this.termRegisterPayUseCase,
  });

  final AvailabilityTermRegistrationUseCase availabilityTermRegistrationUseCase;
  final TermRegisterPayUseCase termRegisterPayUseCase;
  RxBool isLoadingTermPayment = RxBool(false);
  late String paymentUrl;
  late AvailabilityTermRegistrationResponseModel responseModel;

  @override
  void onInit() {
    super.onInit();
    getAvailabilityTermRegistration();
  }

  Future<void> getAvailabilityTermRegistration() async {
    change(null, status: RxStatus.loading());
    final finance = await availabilityTermRegistrationUseCase(
      params: NoParams(),
    );
    finance.fold(
      (l) => change(null, status: RxStatus.error(l)),
      (r) {
        if (r.status == true) {
          responseModel = r;
          change(r, status: RxStatus.success());
        } else {
          change(null, status: RxStatus.error(r.message));
        }
      },
    );
  }

  Future<void> termRegisterPay({required int termId}) async {
    isLoadingTermPayment.value = true;
    change(null, status: RxStatus.loading());
    final finance = await termRegisterPayUseCase(params: termId);
    finance.fold(
      (l) => HelperMethod.showSnackBar(
        title: LocalizationKeys.failed.tr,
        message: l!,
      ),
      (r) {
        if (r.status == true && r.code != 200) {
          paymentUrl = r.paymentUrl!;
        } else {
          HelperMethod.showSnackBar(
            title: LocalizationKeys.failed.tr,
            message: r.message!,
          );
        }
      },
    );
    isLoadingTermPayment.value = false;
  }

  Future<void> onTapTermRegisterPayment() async {
    await termRegisterPay(termId: responseModel.data!.termId);
    if (responseModel.data!.cost > 0) {
      Get.to(
        PaymentWebViewScreen(
          paymentUrl: paymentUrl,
          onBackCallBack: getAvailabilityTermRegistration,
        ),
      );
    } else {
      await getAvailabilityTermRegistration();
    }
  }
}
