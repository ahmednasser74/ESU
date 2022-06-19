import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/colors.dart';
import 'package:esu/core/src/styles.dart';
import 'package:esu/core/src/widgets/custom_rich_text.dart';
import 'package:esu/features/student_actions/data/models/response/ticket_details/tickets_details_data_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TicketDetailsHeaderWidget extends StatelessWidget {
  const TicketDetailsHeaderWidget({
    Key? key,
    required this.data,
  }) : super(key: key);
  final TicketDetailsDataResponseModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
      decoration: CustomStyle.containerShadowDecoration.copyWith(
        color: AppColors.primaryLightColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(16.w),
          bottomRight: Radius.circular(16.w),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              CustomRichText(
                title: '${LocalizationKeys.subject.tr}: ',
                value: data.subject,
                fontSize: 12.sp,
                titleColor: Colors.black,
              ),
              CustomRichText(
                title: '${LocalizationKeys.status.tr}: ',
                value: data.status!,
                titleColor: Colors.black,
                fontSize: 12.sp,
              ),
            ],
          ),
          // Row(
          //   children: [
          //     Text('${LocalizationKeys.description.tr}: '),
          //     Expanded(child: Html(data: data.body)),
          //   ],
          // ),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: CustomRichText(
                  title: '${LocalizationKeys.category.tr}: ',
                  value: data.category,
                  titleColor: Colors.black,
                  fontSize: 12.sp,
                ),
              ),
              CustomRichText(
                title: '${LocalizationKeys.createdAt.tr}: ',
                value: DateFormat('E d MMM yyyy hh:mm aaa').format(
                  DateTime.parse(data.createdAt),
                ),
                titleColor: Colors.black,
                fontSize: 12.sp,
              ),
            ],
          ),
          SizedBox(height: 4.h),
        ],
      ),
    );
  }
}
