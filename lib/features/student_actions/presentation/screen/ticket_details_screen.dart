import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/src/colors.dart';
import 'package:boilerplate/core/src/styles.dart';
import 'package:boilerplate/core/src/widgets/app_empty_widget.dart';
import 'package:boilerplate/core/src/widgets/custom_rich_text.dart';
import 'package:boilerplate/core/src/widgets/error_widget.dart';
import 'package:boilerplate/core/src/widgets/loading_indicator_widget.dart';
import 'package:boilerplate/features/student_actions/data/models/response/ticket_details/tickets_details_data_response_model.dart';
import 'package:boilerplate/features/student_actions/presentation/controller/ticket_details_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TicketDetailsScreen extends GetView<TicketDetailsController> {
  const TicketDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocalizationKeys.ticketDetails.tr)),
      body: controller.obx(
        (state) => Column(
          children: [
            TicketDetailsHeaderWidget(data: state!.data!),
          ],
        ),
        onError: (e) => AppErrorWidget(errorMessage: e),
        onLoading: const LoadingIndicatorWidget(),
        onEmpty: AppEmptyWidget(title: LocalizationKeys.noRepliesFound.tr),
      ),
    );
  }
}

class TicketDetailsHeaderWidget extends StatelessWidget {
  const TicketDetailsHeaderWidget({
    Key? key,
    required this.data,
  }) : super(key: key);
  final TicketDetailsDataResponseModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 12.h),
      decoration: CustomStyle.containerShadowDecoration.copyWith(
        color: AppColors.primaryLightColor,
        borderRadius: BorderRadius.zero,
        boxShadow: [],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Text(
              '${LocalizationKeys.ticketNumber.tr}#${data.id}',
              style: TextStyle(fontSize: 14.sp),
            ),
          ),
          SizedBox(height: 12.h),
          CustomRichText(
            title: '${LocalizationKeys.subject.tr}: ',
            value: data.subject,
            fontSize: 12.sp,
          ),
          Row(
            children: [
              Text('${LocalizationKeys.description.tr}: '),
              Expanded(child: Html(data: data.body)),
            ],
          ),
          Row(
            children: [
              CustomRichText(
                title: '${LocalizationKeys.createdAt.tr}: ',
                value: DateFormat('E d MMM yyyy')
                    .format(DateTime.parse(data.createdAt)),
                fontSize: 12.sp,
              ),
              const Spacer(),
            ],
          ),
          SizedBox(height: 12.h),
          Row(
            children: [
              CustomRichText(
                title: '${LocalizationKeys.category.tr}: ',
                value: data.category,
                fontSize: 12.sp,
              ),
              const Spacer(),
              CustomRichText(
                title: '${LocalizationKeys.status.tr}: ',
                value: data.status,
                fontSize: 12.sp,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
