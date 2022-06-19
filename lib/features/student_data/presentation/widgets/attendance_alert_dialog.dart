import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/colors.dart';
import 'package:esu/core/src/styles.dart';
import 'package:esu/core/src/widgets/conditional_builder.dart';
import 'package:esu/core/src/widgets/custom_rich_text.dart';
import 'package:esu/features/student_data/data/models/response/attendance/attendance_item_details_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AttendanceDetailsDialog extends StatelessWidget {
  const AttendanceDetailsDialog({
    Key? key,
    required this.attendanceDetails,
  }) : super(key: key);
  final List<AttendanceItemDetailsResponseModel> attendanceDetails;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      insetPadding: EdgeInsets.all(20.r),
      child: SizedBox(
        height: .70.sh,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              leading: IconButton(
                onPressed: () => Get.back(),
                icon: const Icon(Icons.close, color: AppColors.primaryColor),
              ),
              title: Text(
                LocalizationKeys.details.tr,
                style: TextStyle(
                  fontSize: 18.sp,
                  color: AppColors.primaryColor,
                ),
              ),
              horizontalTitleGap: .25.sw,
            ),
            Expanded(
              child: ListView.separated(
                itemCount: attendanceDetails.length,
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 12.h),
                separatorBuilder: (_, index) => SizedBox(height: 14.h),
                itemBuilder: (_, index) {
                  final detailsItem = attendanceDetails.elementAt(index);
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 12.h),
                    decoration: CustomStyle.containerShadowDecoration.copyWith(
                      border: Border.all(color: AppColors.primaryLightColor),
                    ),
                    child: Column(
                      children: [
                        Text(
                          detailsItem.name,
                          style: TextStyle(fontSize: 14.sp),
                        ),
                        SizedBox(height: 8.h),
                        CustomRichText(
                          title: '${LocalizationKeys.openTime.tr}: ',
                          value: detailsItem.openTime,
                        ),
                        SizedBox(height: 8.h),
                        CustomRichText(
                          title: '${LocalizationKeys.closeTime.tr}: ',
                          value: detailsItem.timeClose,
                        ),
                        SizedBox(height: 8.h),
                        ConditionalBuilder(
                          condition: detailsItem.isFinished == 1,
                          builder: (_) => Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                '${LocalizationKeys.status.tr}: ',
                                style: const TextStyle(
                                    color: AppColors.primaryColor),
                              ),
                              Text(
                                LocalizationKeys.finished.tr,
                                style: const TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
