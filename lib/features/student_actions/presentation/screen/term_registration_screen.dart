import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/assets.gen.dart';
import 'package:esu/core/src/colors.dart';
import 'package:esu/core/src/widgets/app_warning_widget.dart';
import 'package:esu/core/src/widgets/app_button.dart';
import 'package:esu/core/src/widgets/loading_indicator_widget.dart';
import 'package:esu/features/student_actions/presentation/controller/term_registration_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class TermRegistrationScreen extends GetView<TermRegistrationController> {
  const TermRegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocalizationKeys.termRegistration.tr)),
      body: controller.obx(
        (state) => Obx(
          () => ModalProgressHUD(
            inAsyncCall: controller.isLoadingTermPayment.value,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 18.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Assets.icons.termRegistration.image(
                    color: Theme.of(context).primaryColor,
                    height: 100.r,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(height: 28.h),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 18.w, vertical: 10.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.w),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 1,
                          blurRadius: 5,
                          offset: const Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Column(
                      children: [
                        Text(
                          state!.message,
                          textAlign: TextAlign.center,
                          style: const TextStyle(color: Colors.red),
                        ),
                        SizedBox(height: 18.h),
                        Text(state.data!.program),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(state.data!.item),
                            Text(
                              '${LocalizationKeys.trimester.tr} ${state.data!.trimester}',
                            ),
                          ],
                        ),
                        SizedBox(height: 10.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              '${LocalizationKeys.scholarshipPercentage.tr} ${state.data!.scholarship}',
                            ),
                            Text(
                              '${LocalizationKeys.cost.tr}  ${state.data!.cost} ${LocalizationKeys.aed.tr}',
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 28.h),
                  AppButton(
                    onPressed: controller.onTapTermRegisterPayment,
                    title: LocalizationKeys.submit.tr,
                    fonSize: 14.sp,
                  ),
                ],
              ),
            ),
          ),
        ),
        onLoading: const LoadingIndicatorWidget(),
        onError: (e) => AppWarningWidget(message: e.toString()),
      ),
    );
  }
}
