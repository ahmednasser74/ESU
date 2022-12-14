import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/assets.gen.dart';
import 'package:esu/core/src/colors.dart';
import 'package:esu/core/src/widgets/app_button.dart';
import 'package:esu/core/src/widgets/loading_indicator_widget.dart';
import 'package:esu/core/helper/helper_methods.dart';
import 'package:esu/features/auth/presentation/controller/submit_admission_controller.dart';
import 'package:esu/core/src/widgets/app_check_box_with_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SubmitRegistrationScreen extends GetView<SubmitAdmissionController> {
  const SubmitRegistrationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        appBar: AppBar(title: Text(LocalizationKeys.submitRegistration.tr)),
        body: ModalProgressHUD(
          inAsyncCall: controller.loadingIndicator.value,
          progressIndicator: const LoadingIndicatorWidget(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.whiteColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Theme.of(context).primaryColor),
                    boxShadow: [
                      BoxShadow(
                        color: Theme.of(context).primaryColor,
                        offset: const Offset(1, 2),
                        blurRadius: 4,
                      )
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Theme.of(context).primaryColor,
                            width: 1.5,
                          ),
                        ),
                        child: Assets.icons.notificationIcon.image(
                          height: 24.sp,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        LocalizationKeys.youShouldToReadTermsAndCondition.tr,
                        style: TextStyle(
                          color: Theme.of(context).primaryColor,
                          fontSize: 16.sp,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 14),
                Row(
                  children: [
                    SizedBox(
                      width: .45.sw,
                      child: GetBuilder<SubmitAdmissionController>(
                        builder: (controller) => AppCheckboxWithTextWidget(
                          value: controller.isTermsAndConditionApproved.value,
                          onChanged: (v) => controller.isTermsAndConditionApproved.value = v,
                          title: LocalizationKeys.iReadAndAgree.tr,
                        ),
                      ),
                    ),
                    SizedBox(width: 4.w),
                    Expanded(
                      child: InkWell(
                        onTap: () => HelperMethod.launchToBrowser(
                          'https://esu.ac.ae/en/privacy-policy-2/',
                        ),
                        child: Text(
                          LocalizationKeys.termsAndCondition.tr,
                          style:  TextStyle(
                            decoration: TextDecoration.underline,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                AppButton(
                  onPressed: controller.submitAdmission,
                  title: LocalizationKeys.submit.tr,
                  minimumSize: const Size(double.infinity, 30),
                ),
                const SizedBox(height: 18),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
