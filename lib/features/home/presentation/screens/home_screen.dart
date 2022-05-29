import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/src/assets.gen.dart';
import 'package:boilerplate/core/src/colors.dart';
import 'package:boilerplate/core/src/routes.dart';
import 'package:boilerplate/core/src/widgets/error_widget.dart';
import 'package:boilerplate/core/src/widgets/loading_indicator_widget.dart';
import 'package:boilerplate/features/home/presentation/controller/home_controller.dart';
import 'package:boilerplate/features/home/presentation/widgets/drawer_widget.dart';
import 'package:boilerplate/features/home/presentation/widgets/home_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends GetView<HomeController> {
  HomeScreen({Key? key}) : super(key: key);
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(LocalizationKeys.home.tr),
        leading: IconButton(
          icon: Assets.icons.menu.image(height: 20.sp),
          onPressed: () => _scaffoldKey.currentState!.openDrawer(),
        ),
        actions: [
          IconButton(
            icon: Assets.icons.notificationIcon.image(
              color: AppColors.primaryColor,
              height: 18.h,
            ),
            onPressed: () => Get.toNamed(Routes.notificationScreen),
          ),
        ],
      ),
      drawer: const Drawer(child: DrawerWidget()),
      body: controller.obx(
        (state) => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            HomeHeaderWidget(data: state!.data!),
            SizedBox(height: 20.h),
            Row(
              children: [
                HomeItemWidget(
                  color: Colors.blue,
                  title: LocalizationKeys.balance.tr,
                  amount: '\$${state.data!.balance}',
                ),
                HomeItemWidget(
                  color: Colors.orange,
                  title: LocalizationKeys.totalAmount.tr,
                  amount: '\$${state.data!.total}',
                ),
              ],
            ),
            SizedBox(height: 20.h),
            Row(
              children: [
                HomeItemWidget(
                  color: Colors.green,
                  title: LocalizationKeys.totalAmountPaid.tr,
                  amount: '\$${state.data!.paid}',
                ),
                HomeItemWidget(
                  color: Colors.red,
                  title: LocalizationKeys.totalAmountUnpaid.tr,
                  amount: '\$${state.data!.unpaid}',
                ),
              ],
            ),
          ],
        ),
        onLoading: const LoadingIndicatorWidget(),
        onError: (error) => AppErrorWidget(errorMessage: error.toString()),
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
            SizedBox(height: 10.h),
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
