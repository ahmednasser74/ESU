import 'package:esu/core/const/end_point.dart';
import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/assets.gen.dart';
import 'package:esu/core/src/colors.dart';
import 'package:esu/core/src/widgets/app_button.dart';
import 'package:esu/features/student_data/data/models/response/letters/letters_data_response_model.dart';
import 'package:esu/features/student_data/presentation/widgets/pdf_viewer_widget.dart';
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
        border: Border.all(color:  Theme.of(context).colorScheme.secondary),
        boxShadow: [
          BoxShadow(
            color:  Theme.of(context).colorScheme.secondary,
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
                  onPressed: () => Get.to(
                    PdfViewerWidget(pdfUrl: '${Endpoints.baseUrl}letters/${letter.id}?lang=en'),
                  ),
                  backgroundColor: Colors.white,
                  borderColor:  Theme.of(context).primaryColor,
                  child: Row(
                    children: [
                      Assets.icons.pdf.image(height: 20.h),
                      SizedBox(width: 6.w),
                      Text(
                        LocalizationKeys.englishVersion.tr,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color:  Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 10.w),
              Expanded(
                child: AppButton(
                  onPressed: () => Get.to(
                    PdfViewerWidget(pdfUrl: '${Endpoints.baseUrl}letters/${letter.id}?lang=ar'),
                  ),
                  backgroundColor: Colors.white,
                  borderColor: Theme.of(context).primaryColor,
                  child: Row(
                    children: [
                      Assets.icons.pdf.image(height: 20.h),
                      SizedBox(width: 6.w),
                      Text(
                        LocalizationKeys.arabicVersion.tr,
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
