import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/src/routes.dart';
import 'package:boilerplate/core/src/widgets/app_empty_widget.dart';
import 'package:boilerplate/core/src/widgets/error_widget.dart';
import 'package:boilerplate/core/src/widgets/loading_indicator_widget.dart';
import 'package:boilerplate/features/student_actions/presentation/controller/ticket_controller.dart';
import 'package:boilerplate/features/student_actions/presentation/widget/ticket_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TicketsScreen extends GetView<TicketsController> {
  const TicketsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(LocalizationKeys.ticketSupport.tr)),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => Get.toNamed(Routes.ticketCreateScreen),
        label: Text(LocalizationKeys.addTicket.tr),
        icon: const Icon(Icons.add),
      ),
      body: controller.obx(
        (state) => ListView.separated(
          padding: EdgeInsets.only(bottom: .1.sh),
          itemCount: state!.data.length,
          separatorBuilder: (_, index) => SizedBox(height: 12.h),
          itemBuilder: (_, index) => TicketItemWidget(
            ticket: state.data.elementAt(index),
          ),
        ),
        onError: (e) => AppErrorWidget(errorMessage: e),
        onLoading: const LoadingIndicatorWidget(),
        onEmpty: AppEmptyWidget(title: LocalizationKeys.noTicketsFound.tr),
      ),
    );
  }
}
