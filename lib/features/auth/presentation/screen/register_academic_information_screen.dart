import 'package:esu/core/const/list_const.dart';
import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/widgets/app_container.dart';
import 'package:esu/core/src/widgets/app_button.dart';
import 'package:esu/core/src/widgets/app_error_widget.dart';
import 'package:esu/core/src/widgets/loading_indicator_widget.dart';
import 'package:esu/features/auth/presentation/controller/academic_info_controller.dart';
import 'package:esu/features/auth/presentation/widgets/auth_drop_down_button.dart';
import 'package:esu/features/auth/presentation/widgets/contract_links_widget.dart';
import 'package:esu/features/auth/presentation/widgets/lookup_drop_down_button.dart';
import 'package:esu/core/src/widgets/app_title_required_widget.dart';
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppContainer(
                  padding: EdgeInsets.all(8.sp),
                  hasBorder: false,
                  boxShadowBlurColor: Colors.redAccent,
                  child: Text(
                    LocalizationKeys.pleaseToCompleteRegistrationBeSureToDownloadContractAndHaveYourSignature.tr,
                    textAlign: TextAlign.center,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
                SizedBox(height: 12.h),
                const ContractLinksWidget(),
                const Spacer(),
                AppTitleRequiredWidget(
                  title: LocalizationKeys.currentCertificate.tr,
                ),
                TitleDropDownButton(
                  list: ListConst().certificateList,
                  isDense: true,
                  initValue: controller.currentCertificate?.name,
                  onChangeValue: (value) {
                    if (value == CertificateType.bachelor.name) {
                      controller.currentCertificate = CertificateType.bachelor;
                      return;
                    } else if (value == CertificateType.master.name) {
                      controller.currentCertificate = CertificateType.master;
                      return;
                    }
                    controller.currentCertificate = CertificateType.secondarySchool;
                    return;
                  },
                ),
                SizedBox(height: 18.h),
                AppTitleRequiredWidget(title: LocalizationKeys.program.tr),
                LookupDropDownButton(
                  list: state!,
                  isDense: true,
                  onChangeValue: (value) => controller.programId = value,
                  initId: controller.programId,
                  programName: controller.programName,
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
