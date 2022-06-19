import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/colors.dart';
import 'package:esu/core/src/routes.dart';
import 'package:esu/core/src/styles.dart';
import 'package:esu/features/student_actions/data/models/response/tickets/tickets_data_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TicketItemWidget extends StatelessWidget {
  const TicketItemWidget({
    Key? key,
    required this.ticket,
  }) : super(key: key);
  final TicketsDataResponseModel ticket;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(
        Routes.ticketDetailsScreen,
        arguments: ticket.id,
      ),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.w, vertical: 8.h),
        margin: EdgeInsets.symmetric(horizontal: 18.w),
        decoration: CustomStyle.containerShadowDecoration.copyWith(
          border: Border.all(color: AppColors.primaryLightColor),
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryColor.withOpacity(0.2),
              blurRadius: 6,
              offset: const Offset(2, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                Text('${LocalizationKeys.subject.tr} : '),
                Expanded(child: Html(data: ticket.subject)),
              ],
            ),
            // Row(
            //   children: [
            //     Text('${LocalizationKeys.body.tr} : '),
            //     Expanded(child: Html(data: ticket.body)),
            //   ],
            // ),
            Row(
              children: [
                Text('${LocalizationKeys.category.tr} : '),
                Expanded(child: Html(data: ticket.category)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${LocalizationKeys.status.tr}: ${ticket.statusName}',
                  style: TextStyle(
                    color: () {
                      if (ticket.isStatusClosed) {
                        return Colors.red;
                      } else if (ticket.isStatusReply) {
                        return AppColors.primaryColor;
                      } else {
                        return Colors.green;
                      }
                    }(),
                  ),
                ),
                Text(
                  DateFormat('E d MMM yyyy hh:mm aaa').format(
                    DateTime.parse(ticket.createdAt),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
