import 'package:boilerplate/core/localization/localization_keys.dart';
import 'package:boilerplate/core/src/assets.gen.dart';
import 'package:boilerplate/core/src/colors.dart';
import 'package:boilerplate/core/src/routes.dart';
import 'package:boilerplate/core/utils/pref_util.dart';
import 'package:boilerplate/features/home/presentation/widgets/log_out_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 160.h,
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          color: AppColors.primaryColor,
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
              Text(
                LocalizationKeys.hello.tr,
                style: const TextStyle(color: Colors.white),
              ),
              SizedBox(height: 6.h),
              Text(
                Get.locale.toString() == 'en'
                    ? SharedPrefs.instance.getUser().student.nameEn
                    : SharedPrefs.instance.getUser().student.nameAr,
                style: TextStyle(color: Colors.white, fontSize: 16.sp),
                textAlign: TextAlign.center,
              )
            ],
          ),
        ),
        Expanded(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              ListTile(
                title: Text(LocalizationKeys.profile.tr),
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
                title: Text(LocalizationKeys.notification.tr),
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
                title: Text(LocalizationKeys.finance.tr),
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
                title: Text(LocalizationKeys.letters.tr),
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
                title: Text(LocalizationKeys.transcript.tr),
                leading: Assets.icons.transcriptIcon.image(
                  color: AppColors.primaryColor,
                  height: 20.h,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed(Routes.transcriptScreen);
                },
              ),
              ListTile(
                title: Text(LocalizationKeys.studentCard.tr),
                leading: Assets.icons.identity.image(
                  color: AppColors.primaryColor,
                  height: 20.h,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed(Routes.studentCardScreen);
                },
              ),
              ListTile(
                title: Text(LocalizationKeys.studyPlans.tr),
                leading: Assets.icons.studyPlan.image(
                  color: AppColors.primaryColor,
                  height: 20.h,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed(Routes.studyPlanScreen);
                },
              ),
              ListTile(
                title: Text(LocalizationKeys.termRegistration.tr),
                leading: Assets.icons.termRegistration.image(
                  color: AppColors.primaryColor,
                  height: 26.h,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed(Routes.termRegistrationScreen);
                },
              ),
              ListTile(
                title: Text(LocalizationKeys.ticketSupport.tr),
                leading: Assets.icons.ticket.image(
                  color: AppColors.primaryColor,
                  height: 26.h,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed(Routes.ticketsScreen);
                },
              ),
              ListTile(
                title: Text(LocalizationKeys.accessToMoodle.tr),
                leading: Assets.icons.accessToMoodle.image(
                  color: AppColors.primaryColor,
                  height: 22.h,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed(Routes.accessToMoodleScreen);
                },
              ),
              ListTile(
                title: Text(LocalizationKeys.lectureTable.tr),
                leading: Assets.icons.lecture.image(
                  color: AppColors.primaryColor,
                  height: 20.h,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed(Routes.lectureTableScreen);
                },
              ),
              ListTile(
                title: Text(LocalizationKeys.schedule.tr),
                leading: Assets.icons.schedule.image(
                  color: AppColors.primaryColor,
                  height: 20.h,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed(Routes.scheduleScreen);
                },
              ),
              ListTile(
                title: Text(LocalizationKeys.settings.tr),
                leading: Assets.icons.settingIcon.image(
                  color: AppColors.primaryColor,
                  height: 20.h,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed(Routes.settingsScreen);
                },
              ),
              ListTile(
                title: Text(LocalizationKeys.faq.tr),
                leading: Assets.icons.faq.image(
                  color: AppColors.primaryColor,
                  height: 26.h,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed(Routes.popularQuestionScreen);
                },
              ),
              ListTile(
                title: Text(LocalizationKeys.logout.tr),
                leading: Assets.icons.logout.image(
                  color: AppColors.primaryColor,
                  height: 20.h,
                ),
                onTap: () {
                  Get.back();
                  LogoutDialog(
                    onTapLogout: () {
                      SharedPrefs.instance.removeAllKeys();
                      Get.offAllNamed(Routes.loginScreen);
                    },
                  ).show(context);
                },
              ),
              SizedBox(height: MediaQuery.of(context).padding.bottom)
            ],
          ),
        ),
      ],
    );
  }
}
