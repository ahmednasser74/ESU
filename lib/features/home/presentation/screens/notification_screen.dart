import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/features/home/presentation/widgets/notification_filter_widget.dart';
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
      body: Column(
        children: [
          NotificationFilterWidget(
            onChange: (value) {},
          ),
          Expanded(
            child: ListView.separated(
              itemCount: 10,
              padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
              separatorBuilder: (context, index) => SizedBox(height: 14.h),
              itemBuilder: (context, index) => const NotificationItemWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
