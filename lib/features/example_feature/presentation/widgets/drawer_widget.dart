import 'package:boilerplate/core/src/assets.gen.dart';
import 'package:boilerplate/core/src/colors.dart';
import 'package:boilerplate/core/src/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          Container(
            height: 140.h,
            alignment: Alignment.center,
            decoration: const BoxDecoration(
              color: AppColors.primaryColor,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.whiteColor,
                      width: 2,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Assets.icons.profileIcon.image(
                      color: AppColors.whiteColor,
                      height: 30.h,
                    ),
                  ),
                ),
                SizedBox(height: 10.h),
                const Text(
                  'Hello',
                  style: TextStyle(color: Colors.white),
                ),
                Text(
                  'Ahmed Nasser',
                  style: TextStyle(color: Colors.white, fontSize: 18.sp),
                )
              ],
            ),
          ),
          ListView(
            shrinkWrap: true,
            children: [
              ListTile(
                title: const Text('Profile'),
                leading: Assets.icons.profileIcon.image(
                  color: AppColors.primaryColor,
                  height: 18.h,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed(Routes.profileScreen);
                },
              ),
              ListTile(
                title: const Text('Notifications'),
                leading: Assets.icons.notificationIcon.image(
                  color: AppColors.primaryColor,
                  height: 20.h,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed(Routes.notificationScreen);
                },
              ),
              ListTile(
                title: const Text('Finance'),
                leading: Assets.icons.financeIcon.image(
                  color: AppColors.primaryColor,
                  height: 24.h,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed(Routes.financeScreen);
                },
              ),
              ListTile(
                title: const Text('Letters'),
                leading: Assets.icons.letterIcon.image(
                  color: AppColors.primaryColor,
                  height: 22.h,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed(Routes.lettersScreen);
                },
              ),
              ListTile(
                title: const Text('Transcript'),
                leading: Assets.icons.transcriptIcon.image(
                  color: AppColors.primaryColor,
                  height: 20.h,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed(Routes.transcriptScreen);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
