import 'package:esu/core/src/colors.dart';
import 'package:esu/core/src/styles.dart';
import 'package:esu/core/src/widgets/custom_button.dart';
import 'package:esu/features/student_data/data/models/response/transcript/transcript_item_response_model.dart';
import 'package:esu/features/student_data/presentation/widgets/transcript_pdf_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TranscriptItemWidget extends StatelessWidget {
  const TranscriptItemWidget({
    Key? key,
    required this.transcriptItem,
  }) : super(key: key);
  final TranscriptItemResponseModel transcriptItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 8.h),
      decoration: CustomStyle.containerShadowDecoration.copyWith(
        border: Border.all(color: AppColors.primaryLightColor),
      ),
      child: Column(
        children: [
          Text(
            transcriptItem.name,
            style: TextStyle(fontSize: 14.sp),
          ),
          SizedBox(height: 14.h),
          AppButton(
            onPressed: () => goToPdf(transcriptItem.id),
            title: 'Show PDF',
            paddingVertical: 0,
            fonSize: 14.sp,
          ),
        ],
      ),
    );
  }

  void goToPdf(int transcriptId) {
    Get.to(TranscriptPdfWidget(transcriptId: transcriptId));
  }
}
