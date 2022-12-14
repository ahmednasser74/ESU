import 'package:esu/core/const/end_point.dart';
import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/colors.dart';
import 'package:esu/core/src/styles.dart';
import 'package:esu/core/src/widgets/app_button.dart';
import 'package:esu/features/student_data/data/models/response/transcript/transcript_item_response_model.dart';
import 'package:esu/features/student_data/presentation/widgets/pdf_viewer_widget.dart';
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
        border: Border.all(color:  Theme.of(context).colorScheme.secondary),
      ),
      child: Column(
        children: [
          Text(
            transcriptItem.name,
            style: TextStyle(fontSize: 14.sp),
          ),
          SizedBox(height: 14.h),
          AppButton(
            onPressed: goToPdfViewer,
            title: LocalizationKeys.showPdf.tr,
            paddingVertical: 0,
            fonSize: 14.sp,
          ),
        ],
      ),
    );
  }

  void goToPdfViewer() {
    Get.to(PdfViewerWidget(pdfUrl: '${Endpoints.baseUrl}transcript?registration_id=${transcriptItem.id}'));
  }
}
