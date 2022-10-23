import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/screen/payment_web_view_screen.dart';
import 'package:esu/core/usecases/usecase.dart';
import 'package:esu/core/helper/helper_methods.dart';
import 'package:esu/features/home/presentation/controller/home_controller.dart';
import 'package:esu/features/student_data/data/models/response/finance/invoice_item/invoice_item_response_model.dart';
import 'package:esu/features/student_data/domain/usecase/finance_pay_url_use_case.dart';
import 'package:esu/features/student_data/domain/usecase/finance_use_case.dart';
import 'package:get/get.dart';

import '../../data/models/response/finance/finance_response_model.dart';
import 'package:injectable/injectable.dart';

@Injectable()

class FinanceController extends GetxController
    with StateMixin<FinanceResponseModel> {
  FinanceController({
    required this.financeUseCase,
    required this.financePayUrlUseCase,
  });

  final FinanceUseCase financeUseCase;
  final FinancePayUrlUseCase financePayUrlUseCase;
  List<InvoiceItemResponseModel> financeList = [];
  final bool haveUnpaidInvoice = Get.arguments ?? false;

  @override
  void onInit() {
    super.onInit();
    getFinance();
  }

  void getFinance() async {
    change(null, status: RxStatus.loading());
    final finance = await financeUseCase(params: NoParams());
    finance.fold(
      (l) => change(null, status: RxStatus.error(l!)),
      (r) {
        if (r.status == true) {
          if (r.data.isEmpty) {
            change(null, status: RxStatus.empty());
          } else {
            financeList = r.data;
            change(r, status: RxStatus.success());
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

  //

  Future<void> payInvoiceUrl({
    required int invoiceId,
    required int index,
  }) async {
    financeList.elementAt(index).isLoadingToPaymentGateway = true;
    update();
    final finance = await financePayUrlUseCase(params: invoiceId);
    finance.fold(
      (l) => HelperMethod.showToast(msg: LocalizationKeys.somethingWentWrong),
      (r) async {
        if (r.status) {
          Get.to(
            () => WebViewScreen(
              url: r.data.url,
              onBackCallBack: getFinance,
            ),
          );
          // await HelperMethod.launchToBrowser(
          //   r.data.url,
          //   mode: LaunchMode.externalNonBrowserApplication,
          // );
        } else {
          HelperMethod.showToast(msg: LocalizationKeys.somethingWentWrong);
        }
      },
    );
    financeList.elementAt(index).isLoadingToPaymentGateway = false;
    update();
  }

  Future<bool> onBack() {
    if (haveUnpaidInvoice) {
      Get.find<HomeController>().getHomeData();
    }
    return Future.value(true);
  }
}
