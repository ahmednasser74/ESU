import 'package:esu/core/const/list_const.dart';
import 'package:esu/core/extentions/spaces_box.dart';
import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/styles.dart';
import 'package:esu/core/src/widgets/app_container.dart';
import 'package:esu/core/src/widgets/custom_button.dart';
import 'package:esu/core/src/widgets/error_widget.dart';
import 'package:esu/core/src/widgets/loading_indicator_widget.dart';
import 'package:esu/features/auth/presentation/controller/academic_info_controller.dart';
import 'package:esu/features/auth/presentation/widgets/auth_drop_down_button.dart';
import 'package:esu/features/auth/presentation/widgets/contract_links_widget.dart';
import 'package:esu/features/auth/presentation/widgets/lookup_drop_down_button.dart';
import 'package:esu/features/auth/presentation/widgets/title_required_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/src/assets.gen.dart';
import '../../../../core/src/colors.dart';

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
              children: [
                AppContainer(
                  borderColor: Colors.red.shade900,
                  boxShadowBlurColor: Colors.redAccent,
                  child: Text(
                    LocalizationKeys.pleaseToCompleteRegistrationBeSureToDownloadContractAndHaveYourSignature.tr,
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 12.h),
                const ContractLinksWidget(),
                const Spacer(),
                TitleRequiredFieldWidget(
                  title: LocalizationKeys.currentCertificate.tr,
                ),
                TitleDropDownButton(
                  list: ListConst().certificateList,
                  isDense: true,
                  onChangeValue: (value) {
                    if (value == ListConst().certificateList[0]) {
                      controller.currentCertificate = 'secondary_school';
                    } else if (value == ListConst().certificateList[1]) {
                      controller.currentCertificate = 'bachelor';
                    } else {
                      controller.currentCertificate = 'master';
                    }
                  },
                ),
                SizedBox(height: 18.h),
                TitleRequiredFieldWidget(title: LocalizationKeys.program.tr),
                LookupDropDownButton(
                  list: state!,
                  isDense: true,
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
