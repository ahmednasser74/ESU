import 'package:boilerplate/core/src/colors.dart';
import 'package:boilerplate/features/student_actions/data/models/response/tickets/tickets_data_replies_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';

class TicketRepliesItemWidget extends StatelessWidget {
  const TicketRepliesItemWidget({
    Key? key,
    required this.reply,
  }) : super(key: key);
  final TicketDataRepliesResponseModel reply;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: reply.isReplyFromStudent
          ? MainAxisAlignment.start
          : MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
            color: reply.isReplyFromStudent
                ? AppColors.primaryLightColor
                : Colors.grey[300],
            borderRadius: BorderRadiusDirectional.only(
              bottomStart: reply.isReplyFromStudent
                  ? Radius.zero
                  : Radius.circular(
                      8.r,
                    ),
              bottomEnd: reply.isReplyFromStudent
                  ? Radius.circular(
                      8.r,
                    )
                  : Radius.zero,
              topStart: Radius.circular(8.r),
              topEnd: Radius.circular(8.r),
            ),
          ),
          constraints: BoxConstraints(
            maxWidth: .75.sw,
          ),
          padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
          margin: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Text(reply.by, style: TextStyle(fontSize: 8.sp)),
              ),
              Html(data: reply.body),
              //TODO: add file manager to download and open files from the reply
              // Text(reply.file),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  DateFormat('E d MMM yyyy hh:mm aaa').format(
                    DateTime.parse(reply.createdAt),
                  ),
                  style: TextStyle(fontSize: 8.sp),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
