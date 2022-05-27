import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/usecases/usecase.dart';
import 'package:boilerplate/core/utils/helper_methods.dart';
import 'package:boilerplate/features/student_data/data/models/response/finance/finance_data_response_model.dart';
import 'package:boilerplate/features/student_data/domain/usecase/finance_pay_url_use_case.dart';
import 'package:boilerplate/features/student_data/domain/usecase/finance_use_case.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher_string.dart';

class FinanceController extends GetxController
    with StateMixin<List<FinanceDataResponseModel>> {
  FinanceController({
    required this.financeUseCase,
    required this.financePayUrlUseCase,
  });

  final FinanceUseCase financeUseCase;
  final FinancePayUrlUseCase financePayUrlUseCase;
  RxBool loadingPaymentGateway = false.obs;

  @override
  void onInit() {
    super.onInit();
    getFinance();
  }

  void getFinance() async {
    final finance = await financeUseCase(params: NoParams());
    finance.fold(
      (l) => change(null, status: RxStatus.error(l!)),
      (r) {
        if (r.status == true) {
          if (r.data.isEmpty) {
            change(null, status: RxStatus.empty());
          } else {
            change(r.data, status: RxStatus.success());
          }
        } else {
          change(
            null,
            status: RxStatus.error(LocalizationKeys.somethingWentWrong.tr),
          );
        }
      },
    );
  }

  void getFinancePayUrl() async {
    loadingPaymentGateway.value = true;
    final finance = await financePayUrlUseCase(params: NoParams());
    finance.fold(
      (l) => HelperMethod.showToast(msg: LocalizationKeys.somethingWentWrong),
      (r) {
        if (r.status == true) {
          HelperMethod.launchToBrowser(
            r.data.url,
            mode: LaunchMode.inAppWebView,
          );
        } else {
          HelperMethod.showToast(msg: LocalizationKeys.somethingWentWrong);
        }
      },
    );
    loadingPaymentGateway.value = false;
  }
}
