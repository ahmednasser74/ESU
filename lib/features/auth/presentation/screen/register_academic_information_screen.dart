import 'package:boilerplate/core/const/list_const.dart';
import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/src/widgets/custom_button.dart';
import 'package:boilerplate/core/src/widgets/error_widget.dart';
import 'package:boilerplate/core/src/widgets/loading_indicator_widget.dart';
import 'package:boilerplate/features/auth/presentation/controller/academic_info_controller.dart';
import 'package:boilerplate/features/auth/presentation/widgets/auth_drop_down_button.dart';
import 'package:boilerplate/features/auth/presentation/widgets/lookup_drop_down_button.dart';
import 'package:boilerplate/features/auth/presentation/widgets/title_required_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class RegisterAcademicInfoScreen extends GetView<AcademicInfoController> {
  const RegisterAcademicInfoScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocalizationKeys.academicInformation.tr)),
      body: Padding(
        padding: const EdgeInsets.all(18),
        child: Form(
          key: controller.formKey,
          child: controller.obx(
            (state) => Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(),
                TitleRequiredFieldWidget(
                  title: LocalizationKeys.currentCertificate.tr,
                ),
                TitleDropDownButton(
                  list: ListConst.certificateList,
                  onChangeValue: (value) =>
                      controller.currentCertificate = value,
                ),
                SizedBox(height: 18.h),
                TitleRequiredFieldWidget(title: LocalizationKeys.program.tr),
                LookupDropDownButton(
                  list: state!,
                  onChangeValue: (value) => controller.programId = value,
                ),
                const Spacer(),
                AppButton(
                  onPressed: controller.goToPersonalInfoScreen,
                  title: LocalizationKeys.next.tr,
                  minimumSize: const Size(double.infinity, 30),
                ),
              ],
            ),
            onError: (error) => AppErrorWidget(errorMessage: error),
            onLoading: const LoadingIndicatorWidget(),
          ),
        ),
      ),
    );
  }
}
