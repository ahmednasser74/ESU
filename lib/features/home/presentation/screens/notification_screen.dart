import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/features/home/presentation/widgets/notification_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocalizationKeys.notification.tr),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        label: Text(LocalizationKeys.markAllAsRead.tr),
        icon: const Icon(Icons.check),
      ),
      body: Column(
        children: [
          // NotificationFilterWidget(
          //   onChange: (value) {},
          // ),
          Expanded(
            child: ListView.separated(
              itemCount: 18,
              padding: EdgeInsetsDirectional.only(
                start: 18.w,
                end: 18.w,
                top: 14.h,
                bottom: .1.sh,
              ),
              separatorBuilder: (context, index) => SizedBox(height: 14.h),
              itemBuilder: (context, index) => const NotificationItemWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
