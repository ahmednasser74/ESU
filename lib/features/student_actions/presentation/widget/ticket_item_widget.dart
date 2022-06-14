import 'package:boilerplate/core/src/colors.dart';
import 'package:boilerplate/core/src/routes.dart';
import 'package:boilerplate/core/src/styles.dart';
import 'package:boilerplate/features/student_actions/data/models/response/tickets/tickets_data_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
            Text(ticket.id.toString()),
            Html(data: ticket.body),
            Html(data: ticket.subject),
            Text(ticket.createdAt),
          ],
        ),
      ),
    );
  }
}
