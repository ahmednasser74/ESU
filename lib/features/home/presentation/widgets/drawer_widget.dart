import 'package:esu/core/localization/localization_keys.dart';
import 'package:esu/core/src/assets.gen.dart';
import 'package:esu/core/src/colors.dart';
import 'package:esu/core/src/routes.dart';
import 'package:esu/core/src/widgets/conditional_builder.dart';
import 'package:esu/core/utils/pref_util.dart';
import 'package:esu/features/auth/presentation/controller/splash_controller.dart';
import 'package:esu/features/home/presentation/widgets/log_out_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  final student = SharedPrefs.instance.getUser();
  final _splashController = Get.find<SplashController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Container(
          height: 200.h,
          alignment: Alignment.center,
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          color: AppColors.primaryColor,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ConditionalBuilder(
                condition: student.photo != null,
                builder: (_) => CircleAvatar(
                  backgroundImage: NetworkImage(student.photo!),
                  radius: 40.r,
                ),
                fallback: (_) => Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: AppColors.whiteColor, width: 2),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: Assets.icons.profileIcon.image(
                      color: AppColors.whiteColor,
                      height: 30.h,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Text(
                LocalizationKeys.hello.tr,
                style: const TextStyle(color: Colors.white),
              ),
              SizedBox(height: 6.h),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 8.w),
                child: Text(
                  Get.locale.toString() == 'en'
                      ? SharedPrefs.instance.getUser().nameEn
                      : SharedPrefs.instance.getUser().nameAr,
                  style: TextStyle(color: Colors.white, fontSize: 16.r),
                  textAlign: TextAlign.center,
                ),
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
                  // Get.to(
                  //   WebViewScreen(
                  //     url: 'https://sisdev.esu.ac.ae/forms',
                  //     onBackCallBack: () {},
                  //   ),
                  // );
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
                title: Text(LocalizationKeys.coursesRegister.tr),
                leading: Assets.icons.termRegistration.image(
                  color: AppColors.primaryColor,
                  height: 26.h,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed(Routes.coursesRegisteredScreen);
                },
              ),
              ListTile(
                title: Text(LocalizationKeys.attendance.tr),
                leading: Assets.icons.attendance.image(
                  color: AppColors.primaryColor,
                  height: 22.h,
                ),
                onTap: () {
                  Navigator.pop(context);
                  Get.toNamed(Routes.attendanceScreen);
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
              const Divider(color: AppColors.primaryLightColor),
              Container(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).padding.bottom + 10.h,
                ),
                child: Center(
                  child: Text(
                    'v${_splashController.appVersion}',
                    style: const TextStyle(color: AppColors.primaryColor),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
