import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/src/widgets/app_empty_widget.dart';
import 'package:boilerplate/core/src/widgets/error_widget.dart';
import 'package:boilerplate/core/src/widgets/loading_indicator_widget.dart';
import 'package:boilerplate/features/home/presentation/controller/notification_controller.dart';
import 'package:boilerplate/features/home/presentation/widgets/notification_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NotificationScreen extends GetView<NotificationController> {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (notifications) => Scaffold(
        appBar: AppBar(
          title: Text(LocalizationKeys.notification.tr),
        ),
        floatingActionButton: Visibility(
          visible: notifications!.isNotEmpty,
          child: FloatingActionButton.extended(
            onPressed: controller.markAllNotificationAsRead,
            label: Text(LocalizationKeys.markAllAsRead.tr),
            icon: const Icon(Icons.check),
          ),
        ),
        body: ListView.separated(
          itemCount: notifications.length,
          padding: EdgeInsetsDirectional.only(
            start: 18.w,
            end: 18.w,
            top: 14.h,
            bottom: .1.sh,
          ),
          separatorBuilder: (context, index) => SizedBox(height: 14.h),
          itemBuilder: (context, index) => NotificationItemWidget(
            notification: notifications.elementAt(index),
            onTapItem: () => controller.markSingleNotificationAsRead(
              id: notifications.elementAt(index).id,
            ),
          ),
        ),
      ),
      onLoading: const LoadingIndicatorWidget(),
      onError: (error) => AppErrorWidget(errorMessage: error.toString()),
      onEmpty: Scaffold(
        appBar: AppBar(
          title: Text(LocalizationKeys.notification.tr),
        ),
        body: AppEmptyWidget(title: LocalizationKeys.noNotificationFound.tr),
      ),
    );
  }
}
