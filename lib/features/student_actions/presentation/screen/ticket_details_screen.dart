import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/src/widgets/app_empty_widget.dart';
import 'package:boilerplate/core/src/widgets/conditional_builder.dart';
import 'package:boilerplate/core/src/widgets/error_widget.dart';
import 'package:boilerplate/core/src/widgets/loading_indicator_widget.dart';
import 'package:boilerplate/features/student_actions/presentation/controller/ticket_details_controller.dart';
import 'package:boilerplate/features/student_actions/presentation/widget/cannot_add_reply_widget.dart';
import 'package:boilerplate/features/student_actions/presentation/widget/ticket_details_header_widget.dart';
import 'package:boilerplate/features/student_actions/presentation/widget/ticket_replies_item_widget.dart';
import 'package:boilerplate/features/student_actions/presentation/widget/ticket_reply_field_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TicketDetailsScreen extends GetView<TicketDetailsController> {
  const TicketDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocalizationKeys.ticketDetails.tr)),
      body: controller.obx(
        (state) => Column(
          children: [
            TicketDetailsHeaderWidget(data: state!),
            SizedBox(height: 12.h),
            Expanded(
              child: ConditionalBuilder(
                condition: state.replies.isEmpty,
                builder: (_) => AppEmptyWidget(
                  title: LocalizationKeys.noRepliesFound.tr,
                ),
                fallback: (_) => ListView.separated(
                  controller: controller.scrollController,
                  itemCount: state.replies.length,
                  separatorBuilder: (context, index) => SizedBox(height: 10.h),
                  itemBuilder: (context, index) => TicketRepliesItemWidget(
                    reply: state.replies[index],
                  ),
                ),
              ),
            ),
            ConditionalBuilder(
              condition: state.isStatusClosed,
              builder: (_) => const CannotAddReplyWidget(),
              fallback: (_) => const TicketReplyFieldWidget(),
            ),
          ],
        ),
        onError: (e) => AppErrorWidget(errorMessage: e),
        onLoading: const LoadingIndicatorWidget(),
      ),
    );
  }
}
