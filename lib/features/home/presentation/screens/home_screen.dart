import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/src/assets.gen.dart';
import 'package:boilerplate/core/src/colors.dart';
import 'package:boilerplate/core/src/routes.dart';
import 'package:boilerplate/features/home/presentation/widgets/drawer_widget.dart';
import 'package:boilerplate/features/home/presentation/widgets/home_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);
  final _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text(LocalizationKeys.home.tr),
        leading: IconButton(
          icon: Assets.icons.menu.image(height: 20.sp),
          onPressed: () => _scaffoldkey.currentState!.openDrawer(),
        ),
        actions: [
          IconButton(
            icon: Assets.icons.notificationIcon.image(
              color: AppColors.primaryColor,
              height: 18.h,
            ),
            onPressed: () => Get.toNamed(Routes.notificationScreen),
          ),
          IconButton(
            icon: Assets.icons.profileIcon.image(
              color: AppColors.primaryColor,
              height: 18.h,
            ),
            onPressed: () => Get.toNamed(Routes.profileScreen),
          ),
        ],
      ),
      drawer: const Drawer(child: DrawerWidget()),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const HomeHeaderWidget(),
          SizedBox(height: 20.h),
          Row(
            children: [
              HomeItemWidget(
                color: Colors.blue,
                title: LocalizationKeys.balance.tr,
                amount: '\$100',
              ),
              HomeItemWidget(
                color: Colors.orange,
                title: LocalizationKeys.totalAmount.tr,
                amount: '\$100',
              ),
            ],
          ),
          SizedBox(height: 20.h),
          Row(
            children: [
              HomeItemWidget(
                color: Colors.green,
                title: LocalizationKeys.totalAmountPaid.tr,
                amount: '\$100',
              ),
              HomeItemWidget(
                color: Colors.red,
                title: LocalizationKeys.totalAmountUnpaid.tr,
                amount: '\$100',
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class HomeItemWidget extends StatelessWidget {
  const HomeItemWidget({
    Key? key,
    required this.title,
    required this.amount,
    required this.color,
  }) : super(key: key);

  final String title;
  final String amount;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 18.w),
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 12.w),
        decoration: BoxDecoration(
          color: color.withOpacity(.2),
          borderRadius: BorderRadius.circular(10.w),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: TextStyle(
                color: color,
                fontSize: 16.sp,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Text(
              amount,
              style: TextStyle(
                color: color,
                fontSize: 16.sp,
              ),
            ),
            Text(
              LocalizationKeys.aed.tr,
              style: TextStyle(
                color: color,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
