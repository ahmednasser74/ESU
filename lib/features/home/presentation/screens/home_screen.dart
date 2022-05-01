import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/src/assets.gen.dart';
import 'package:boilerplate/core/src/colors.dart';
import 'package:boilerplate/core/src/routes.dart';
import 'package:boilerplate/features/home/presentation/widgets/drawer_widget.dart';
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
          icon: Assets.icons.menu.image(height: 18.sp),
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
      body: Container(),
    );
  }
}
