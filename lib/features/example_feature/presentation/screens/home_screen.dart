import 'package:boilerplate/core/src/assets.gen.dart';
import 'package:boilerplate/core/src/colors.dart';
import 'package:boilerplate/core/src/routes.dart';
import 'package:boilerplate/features/example_feature/presentation/widgets/drawer_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
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
