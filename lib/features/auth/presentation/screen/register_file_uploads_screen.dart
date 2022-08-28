import 'dart:io';

import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/routes.dart';
import 'package:esu/core/src/widgets/app_button.dart';
import 'package:esu/core/src/widgets/file_picker_widget.dart';
import 'package:esu/core/utils/helper_methods.dart';
import 'package:esu/features/auth/data/model/data_holder/file_upload_data_holder_model.dart';
import 'package:esu/features/auth/presentation/controller/submit_admission_controller.dart';
import 'package:esu/features/auth/presentation/widgets/contract_links_widget.dart';
import 'package:esu/core/src/widgets/app_title_required_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class RegisterFileUploadsScreen extends StatelessWidget {
  RegisterFileUploadsScreen({Key? key}) : super(key: key);

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late File nationalPassportFile;
  late File latestAcademicQualificationFile;
  late File transcriptFile;
  late File contractFile;
  late File? cvFile;
  late int rule;

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
              AppTitleRequiredWidget(
                title: LocalizationKeys.copyOfYourIdOrPassport.tr,
              ),
              FilePickerWidget(
                fileCallBack: (file) => nationalPassportFile = file,
                hint: ' (image or .pdf)',
                allowToPdf: true,
                allowToImages: true,
              ),
              AppTitleRequiredWidget(
                title: LocalizationKeys.copyOfTheAcademicCertificate.tr,
              ),
              FilePickerWidget(
                fileCallBack: (file) => latestAcademicQualificationFile = file,
                hint: ' (image or .pdf)',
                allowToPdf: true,
                allowToImages: true,
              ),
              AppTitleRequiredWidget(
                title: LocalizationKeys.copyOfTranscript.tr,
              ),
              FilePickerWidget(
                fileCallBack: (file) => transcriptFile = file,
                hint: ' .pdf, .doc or .docx',
                allowToPdf: true,
                allowToDoc: true,
                allowToDocx: true,
              ),
              AppTitleRequiredWidget(
                title: LocalizationKeys.copyOfTheStudentsContractWithTheUniversity.tr,
                titleSize: 18,
              ),
              const ContractLinksWidget(),
              const SizedBox(height: 8),
              FilePickerWidget(
                fileCallBack: (file) => contractFile = file,
                hint: ' .pdf, .doc or .docx',
                allowToPdf: true,
                allowToDoc: true,
                allowToDocx: true,
              ),
              const SizedBox(height: 8),
              AppTitleRequiredWidget(
                title: LocalizationKeys.uploadCv.tr,
                isRequired: false,
              ),
              FilePickerWidget(
                fileCallBack: (file) => cvFile = file,
                fieldIsRequired: false,
                allowToPdf: true,
              ),
              SizedBox(height: 30.h),
              AppButton(
                onPressed: onTapNext,
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

  void onTapNext() {
    if (formKey.currentState!.validate()) {
      final admissionController = Get.find<SubmitAdmissionController>();
      admissionController.fileUploadInfo = FileUploadDataHolder(
        nationalPassportFile: nationalPassportFile,
        latestAcademicQualificationFile: latestAcademicQualificationFile,
        transcriptFile: transcriptFile,
        contractFile: contractFile,
        rule: 1,
      );
      Get.toNamed(Routes.submitRegistrationScreen);
    } else {
      HelperMethod.showToast(msg: LocalizationKeys.completeAllTheFields.tr);
    }
  }
}
