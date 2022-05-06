import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/src/colors.dart';
import 'package:boilerplate/core/src/routes.dart';
import 'package:boilerplate/core/src/widgets/custom_button.dart';
import 'package:boilerplate/core/src/widgets/file_picker_widget.dart';
import 'package:boilerplate/core/utils/helper_methods.dart';
import 'package:boilerplate/features/auth/presentation/widgets/title_required_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class RegisterFileUploadsScreen extends StatelessWidget {
  RegisterFileUploadsScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocalizationKeys.filesUpload.tr)),
      body: Form(
        key: formKey,
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleRequiredFieldWidget(
                title: LocalizationKeys.copyOfYourIdOrPassport.tr,
              ),
              FilePickerWidget(
                fileCallBack: (file) {},
                hint: ' (image or .pdf)',
                allowToPdf: true,
                allowToImages: true,
              ),
              TitleRequiredFieldWidget(
                title: LocalizationKeys.copyOfTheAcademicCertificate.tr,
              ),
              FilePickerWidget(
                fileCallBack: (file) {},
                hint: ' (image or .pdf)',
                allowToPdf: true,
                allowToImages: true,
              ),
              TitleRequiredFieldWidget(
                title: LocalizationKeys.copyOfTranscript.tr,
              ),
              FilePickerWidget(
                fileCallBack: (file) {},
                hint: ' .pdf, .doc or .docx',
                allowToPdf: true,
                allowToDoc: true,
                allowToDocx: true,
              ),
              TitleRequiredFieldWidget(
                title: LocalizationKeys
                    .copyOfTheStudentsContractWithTheUniversity.tr,
                titleSize: 18,
              ),
              InkWell(
                onTap: () async => await HelperMethod.launchToBrowser(
                  'https://esu.ac.ae/wp-content/uploads/2021/10/pro_con.pdf',
                ),
                child: Text(
                  LocalizationKeys.bachelorMasterContractDownloadLink.tr,
                  style: const TextStyle(
                    color: AppColors.primaryColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              InkWell(
                onTap: () async => await HelperMethod.launchToBrowser(
                  'https://esu.ac.ae/wp-content/uploads/2021/11/phd_co_04.pdf',
                ),
                child: Text(
                  LocalizationKeys.phdContractDownloadLink.tr,
                  style: const TextStyle(
                    color: AppColors.primaryColor,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                LocalizationKeys
                    .theContractMustBeSignedHandwrittenAndOnAllPages.tr,
                style: const TextStyle(color: Colors.red, fontSize: 13),
              ),
              const SizedBox(height: 8),
              FilePickerWidget(
                fileCallBack: (file) {},
                hint: ' .pdf, .doc or .docx',
                allowToPdf: true,
                allowToDoc: true,
                allowToDocx: true,
              ),
              const SizedBox(height: 8),
              TitleRequiredFieldWidget(
                title: LocalizationKeys.uploadCv.tr,
                isRequired: false,
              ),
              FilePickerWidget(
                fileCallBack: (file) {},
                fieldIsRequired: false,
                allowToPdf: true,
              ),
              SizedBox(height: 30.h),
              AppButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    print('validate');
                  } else {
                    print('Not validate');
                  }
                  Get.toNamed(Routes.submitRegistrationScreen);
                },
                title: LocalizationKeys.next.tr,
                minimumSize: const Size(double.infinity, 30),
              ),
              SizedBox(height: 18.h),
            ],
          ),
        ),
      ),
    );
  }
}
