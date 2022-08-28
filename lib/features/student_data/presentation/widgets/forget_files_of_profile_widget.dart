import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/widgets/file_picker_widget.dart';
import 'package:esu/core/src/widgets/app_title_required_widget.dart';
import 'package:esu/features/home/data/models/response/chec_profile_files/check_edit_profile_files_data_response_model.dart';
import 'package:esu/features/home/presentation/controller/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetFilesOfProfileWidget extends StatelessWidget {
  const ForgetFilesOfProfileWidget({
    Key? key,
    required this.state,
    required this.controller,
  }) : super(key: key);
  final CheckEditProfileFilesDataResponseModel? state;
  final ProfileController controller;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ///passport
        Visibility(
          visible: state?.nationalPassportFile ?? false,
          child: Column(
            children: [
              AppTitleRequiredWidget(
                title: LocalizationKeys.copyOfYourIdOrPassport.tr,
              ),
              FilePickerWidget(
                fileCallBack: (file) => controller.nationalPassportFile = file,
                hint: ' (image or .pdf)',
                allowToPdf: true,
                allowToImages: true,
              ),
            ],
          ),
        ),

        ///transcript
        Visibility(
          visible: state?.transcriptFile ?? false,
          child: Column(
            children: [
              AppTitleRequiredWidget(
                title: LocalizationKeys.copyOfTranscript.tr,
              ),
              FilePickerWidget(
                fileCallBack: (file) => controller.transcriptFile = file,
                hint: ' .pdf, .doc or .docx',
                allowToPdf: true,
                allowToDoc: true,
                allowToDocx: true,
              ),
            ],
          ),
        ),

        ///academic certificate
        Visibility(
          visible: state?.latestAcademicQualificationFile ?? false,
          child: Column(
            children: [
              AppTitleRequiredWidget(
                title: LocalizationKeys.copyOfTheAcademicCertificate.tr,
              ),
              FilePickerWidget(
                fileCallBack: (file) =>
                    controller.latestAcademicQualificationFile = file,
                hint: ' (image or .pdf)',
                allowToPdf: true,
                allowToImages: true,
              ),
            ],
          ),
        ),

        ///contract
        Visibility(
          visible: state?.contractFile ?? false,
          child: Column(
            children: [
              AppTitleRequiredWidget(
                title: LocalizationKeys
                    .copyOfTheStudentsContractWithTheUniversity.tr,
                titleSize: 18,
              ),
              FilePickerWidget(
                fileCallBack: (file) => controller.contractFile = file,
                hint: ' .pdf, .doc or .docx',
                allowToPdf: true,
                allowToDoc: true,
                allowToDocx: true,
              ),
            ],
          ),
        ),

        ///cv
        Visibility(
          visible: state?.cv ?? false,
          child: Column(
            children: [
              AppTitleRequiredWidget(
                title: LocalizationKeys.uploadCv.tr,
                isRequired: false,
              ),
              FilePickerWidget(
                fileCallBack: (file) => controller.cvFile = file,
                fieldIsRequired: false,
                allowToPdf: true,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
