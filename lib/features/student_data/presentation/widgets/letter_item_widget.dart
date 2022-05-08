import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/src/assets.gen.dart';
import 'package:boilerplate/core/src/colors.dart';
import 'package:boilerplate/core/src/widgets/custom_button.dart';
import 'package:boilerplate/features/student_data/data/models/response/letters_data_response_model.dart';
import 'package:boilerplate/features/student_data/presentation/screen/letter_pdf_viewer_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LetterItemWidget extends StatelessWidget {
  const LetterItemWidget({
    Key? key,
    required this.letter,
  }) : super(key: key);
  final LettersDataResponseModel letter;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.w),
        color: Colors.white,
        border: Border.all(color: AppColors.primaryColor),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryColor.withOpacity(0.1),
            blurRadius: 2,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            Get.locale.toString() == 'ar' ? letter.titleAr : letter.titleEn,
            style: TextStyle(fontSize: 18.sp),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: AppButton(
                  onPressed: () =>
                      Get.to(LetterPdfViewerScreen(id: letter.id, lang: 'en')),
                  child: Row(
                    children: [
                      Assets.icons.pdf.image(height: 20.h),
                      SizedBox(width: 6.w),
                      Text(
                        LocalizationKeys.englishVersion.tr,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  backgroundColor: Colors.white,
                  borderColor: AppColors.primaryColor,
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: AppButton(
                  onPressed: () =>
                      Get.to(LetterPdfViewerScreen(id: letter.id, lang: 'ar')),
                  child: Row(
                    children: [
                      Assets.icons.pdf.image(height: 20.h),
                      SizedBox(width: 6.w),
                      Text(
                        LocalizationKeys.arabicVersion.tr,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: AppColors.primaryColor,
                        ),
                      ),
                    ],
                  ),
                  backgroundColor: Colors.white,
                  borderColor: AppColors.primaryColor,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
