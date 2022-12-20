import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/widgets/app_text_field_widget.dart';
import 'package:esu/core/src/widgets/conditional_builder.dart';
import 'package:esu/core/src/widgets/app_button.dart';
import 'package:esu/core/src/widgets/app_error_widget.dart';
import 'package:esu/core/src/widgets/file_picker_widget.dart';
import 'package:esu/core/src/widgets/loading_indicator_widget.dart';
import 'package:esu/features/student_actions/presentation/controller/ticket_create_controller.dart';
import 'package:esu/features/student_actions/presentation/widget/category_drop_down_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TicketCreateScreen extends GetView<TicketCreateController> {
  const TicketCreateScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocalizationKeys.ticketCreate.tr)),
      body: Obx(
        () => ConditionalBuilder(
          condition: controller.isLoading.value,
          builder: (_) => const LoadingIndicatorWidget(),
          fallback: (_) => ConditionalBuilder(
            condition: controller.isError.value,
            builder: (_) => AppErrorWidget(
              errorMessage: controller.errorMessage.value,
            ),
            fallback: (_) => Form(
              key: controller.formKey,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.w),
                child: Column(
                  children: [
                    AppTextFieldWidget(
                      controller: controller.subjectTEC,
                      hint: LocalizationKeys.subject.tr,
                      dispose: false,
                      validator: (value) => validation(
                        value!,
                        LocalizationKeys.pleaseEnterValidSubject.tr,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    AppTextFieldWidget(
                      controller: controller.bodyTEC,
                      hint: LocalizationKeys.body.tr,
                      dispose: false,
                      validator: (value) => validation(
                        value!,
                        LocalizationKeys.pleaseEnterValidBody.tr,
                      ),
                    ),
                    SizedBox(height: 12.h),
                    FilePickerWidget(
                      fileCallBack: (file) => controller.pickedFile = file,
                      fieldIsRequired: false,
                      allowToDoc: true,
                      allowToDocx: true,
                      allowToImages: true,
                      allowToPdf: true,
                    ),
                    SizedBox(height: 12.h),
                    CategoryDropDownButton(
                      list: controller.ticketCategoriesResponseModel.data,
                      onChangeValue: (value) =>
                          controller.categoryId = value.id,
                      isDense: true,
                    ),
                    SizedBox(height: 40.h),
                    AppButton(
                      title: LocalizationKeys.addTicket.tr,
                      fonSize: 16.sp,
                      onPressed: () {
                        if (controller.formKey.currentState!.validate()) {
                          controller.ticketCreate(
                            subject: controller.subjectTEC.text,
                            body: controller.bodyTEC.text,
                            categoryId: controller.categoryId,
                            file: controller.pickedFile,
                          );
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  String? validation(String value, String errorMsg) {
    if (value.isEmpty || value.length < 5) {
      return errorMsg;
    }
    return null;
  }
}
